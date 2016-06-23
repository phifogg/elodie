"""
The media module provides a base :class:`Media` class for media objects that
are tracked by Elodie. The Media class provides some base functionality used
by all the media types, but isn't itself used to represent anything. Its
sub-classes (:class:`~elodie.media.audio.Audio`,
:class:`~elodie.media.photo.Photo`, and :class:`~elodie.media.video.Video`)
are used to represent the actual files.

.. moduleauthor:: Jaisen Mathai <jaisen@jmathai.com>
"""

# load modules
from elodie import constants
from elodie.dependencies import get_exiftool
from elodie.external.pyexiftool import ExifTool
from elodie.media.base import Base

import os
import re
import subprocess


class Media(Base):

    """The base class for all media objects.

    :param str source: The fully qualified path to the video file.
    """

    __name__ = 'Media'

    d_coordinates = {
        'latitude': 'latitude_ref',
        'longitude': 'longitude_ref'
    }

    def __init__(self, source=None):
        super(Media, self).__init__(source)
        self.exif_map = {
            'date_taken': [
                'EXIF:DateTimeOriginal',
                'EXIF:DateTime',
                'EXIF:DateTimeDigitized'
            ]
        }
        self.album_key = 'XMP:Album'
        self.title_key = 'XMP:Title'
        self.latitude_keys = ['EXIF:GPSLatitude']
        self.longitude_keys = ['EXIF:GPSLongitude']
        self.latitude_ref_key = 'EXIF:GPSLatitudeRef'
        self.longitude_ref_key = 'EXIF:GPSLongitudeRef'
        self.set_gps_ref = True
        self.exiftool_addedargs = [
            '-overwrite_original',
            u'-config',
            u'"{}"'.format(constants.exiftool_config)
        ]

    def get_album(self):
        """Get album from EXIF

        :returns: None or string
        """
        if(not self.is_valid()):
            return None

        exiftool_attributes = self.get_exiftool_attributes()
        if exiftool_attributes is None:
            return None

        if self.album_key not in exiftool_attributes:
            return None

        return exiftool_attributes[self.album_key]

    def get_coordinate(self, type='latitude'):
        """Get latitude or longitude of media from EXIF

        :param str type: Type of coordinate to get. Either "latitude" or
            "longitude".
        :returns: float or None if not present in EXIF or a non-photo file
        """

        exif = self.get_exiftool_attributes()
        if not exif:
            return None

        # The lat/lon _keys array has an order of precedence.
        # The first key is writable and we will give the writable
        #   key precence when reading.
        direction_multiplier = 1
        for key in self.latitude_keys + self.longitude_keys:
            # TODO: verify that we need to check ref key
            #   when self.set_gps_ref != True
            if type == 'latitude' and key in self.latitude_keys and key in exif:
                if self.latitude_ref_key in exif and exif[self.latitude_ref_key] == 'S': #noqa
                    direction_multiplier = -1
                return exif[key] * direction_multiplier
            elif type == 'longitude' and key in self.longitude_keys and key in exif: #noqa
                if self.longitude_ref_key in exif and exif[self.longitude_ref_key] == 'W': #noqa
                    direction_multiplier = -1
                return exif[key] * direction_multiplier

        return None

    def get_exiftool_attributes(self):
        """Get attributes for the media object from exiftool.

        :returns: dict, or False if exiftool was not available.
        """
        source = self.source
        exiftool = get_exiftool()
        if(exiftool is None):
            return False

        with ExifTool(addedargs=self.exiftool_addedargs) as et:
            metadata = et.get_metadata(source)
            if not metadata:
                return False

        return metadata

    def get_title(self):
        """Get the title for a photo of video

        :returns: str or None if no title is set or not a valid media type
        """
        if(not self.is_valid()):
            return None

        exiftool_attributes = self.get_exiftool_attributes()

        if exiftool_attributes is None:
            return None

        if(self.title_key not in exiftool_attributes):
            return None

        return exiftool_attributes[self.title_key]

    def reset_cache(self):
        """Resets any internal cache
        """
        self.exiftool_attributes = None
        super(Media, self).reset_cache()

    def set_album(self, album):
        """Set album for a photo

        :param str name: Name of album
        :returns: bool
        """
        if(not self.is_valid()):
            return None

        source = self.source

        tags = {self.album_key: album}
        status = self.__set_tags(tags)
        self.reset_cache()

        return status

    def set_date_taken(self, time):
        """Set the date/time a photo was taken.

        :param datetime time: datetime object of when the photo was taken
        :returns: bool
        """
        if(time is None):
            return False

        source = self.source

        tags = {}
        formatted_time = time.strftime('%Y:%m:%d %H:%M:%S')
        for key in self.exif_map['date_taken']:
            tags[key] = formatted_time

        status = self.__set_tags(tags)
        self.reset_cache()
        return status

    def set_location(self, latitude, longitude):
        if(not self.is_valid()):
            return None

        source = self.source

        # The lat/lon _keys array has an order of precedence.
        # The first key is writable and we will give the writable
        #   key precence when reading.
        tags = {
            self.latitude_keys[0]: latitude,
            self.longitude_keys[0]: longitude,
        }

        # If self.set_gps_ref == True then it means we are writing an EXIF
        #   GPS tag which requires us to set the reference key.
        # That's because the lat/lon are absolute values.
        if self.set_gps_ref:
            if latitude < 0:
                tags[self.latitude_ref_key] = 'S'

            if longitude < 0:
                tags[self.longitude_ref_key] = 'W'

        status = self.__set_tags(tags)
        self.reset_cache()

        return status

    def set_title(self, title):
        """Set title for a photo.

        :param str title: Title of the photo.
        :returns: bool
        """
        if(not self.is_valid()):
            return None

        if(title is None):
            return None

        source = self.source

        tags = {self.title_key: title}
        status = self.__set_tags(tags)
        self.reset_cache()

        return status

    def __set_tags(self, tags):
        if(not self.is_valid()):
            return None

        source = self.source

        status = ''
        with ExifTool(addedargs=self.exiftool_addedargs) as et:
            status = et.set_tags(tags, source)

        return status != ''

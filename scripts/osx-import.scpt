FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ; 5 This script will first check if you NAS is available     � 	 	 j   T h i s   s c r i p t   w i l l   f i r s t   c h e c k   i f   y o u   N A S   i s   a v a i l a b l e   
  
 l     ��  ��    R L If NAS is available it will try to mount the volumne if not already mounted     �   �   I f   N A S   i s   a v a i l a b l e   i t   w i l l   t r y   t o   m o u n t   t h e   v o l u m n e   i f   n o t   a l r e a d y   m o u n t e d      l     ��  ��    K E If all is mounted, elodie will be started to import your media files     �   �   I f   a l l   i s   m o u n t e d ,   e l o d i e   w i l l   b e   s t a r t e d   t o   i m p o r t   y o u r   m e d i a   f i l e s      l     ��������  ��  ��        l     ��  ��    ( " configure all relevant paths here     �   D   c o n f i g u r e   a l l   r e l e v a n t   p a t h s   h e r e      j     �� �� 0 elodie_script    m        �   > < d e f i n e   p a t h   t o   y o u r   e l o d i e . p y >     !   j    �� "�� 0 	im_folder   " m     # # � $ $ F < d e f i n e   p a t h   t o   y o u r   i m p o r t   f o l d e r > !  % & % j    �� '�� 0 	nas_drive   ' m     ( ( � ) ) � < d e f i n e   u r l   t o   y o u r   N A S   d r i v e ,   e . g .   a f p : / / ; A U T H = N o   U s e r   A u t h e n t @ x x x . x x x . x x x . x x x / > &  * + * j   	 �� ,�� 0 
nas_volume   , m   	 
 - - � . . R < d e f i n e   v o l u m e   o n   N A S   d r i v e ,   e . g .   P u b l i c > +  / 0 / l     ��������  ��  ��   0  1 2 1 l     �� 3 4��   3 &   no more changes below this line    4 � 5 5 @   n o   m o r e   c h a n g e s   b e l o w   t h i s   l i n e 2  6 7 6 i     8 9 8 I     �� : ;
�� .facofgetnull���     alis : o      ���� 0 this_folder   ; �� <��
�� 
flst < o      ���� 0 these_items  ��   9 k     � = =  > ? > l     ��������  ��  ��   ?  @ A @ r      B C B n      D E D 1    ��
�� 
psxp E o     ���� 0 this_folder   C o      ���� 0 posix_folder   A  F G F l   ��������  ��  ��   G  H I H Q    � J K L J k   	 � M M  N O N l  	 	�� P Q��   P 3 - first check and mount NAS drive if available    Q � R R Z   f i r s t   c h e c k   a n d   m o u n t   N A S   d r i v e   i f   a v a i l a b l e O  S T S r   	  U V U I  	 �� W��
�� .sysoexecTEXT���     TEXT W m   	 
 X X � Y Y B p i n g   - c   1   1 9 2 . 1 6 8 . 1 7 8 . 3 5 ;   e c h o   - n��   V o      ���� 	0 intnt   T  Z [ Z r     \ ] \ n     ^ _ ^ m    ��
�� 
nmbr _ n    ` a ` 2   ��
�� 
cpar a o    ���� 	0 intnt   ] o      ���� 	0 paras   [  b c b Z    � d���� e d A     f g f o    ���� 	0 paras   g m    ���� ��  ��   e k   # � h h  i j i r   # & k l k m   # $ m m � n n  P u b l i c l o      ���� 0 servervolume serverVolume j  o p o r   ' , q r q b   ' * s t s m   ' ( u u � v v V a f p : / / ; A U T H = N o   U s e r   A u t h e n t @ 1 9 2 . 1 6 8 . 1 7 8 . 3 5 / t o   ( )���� 0 servervolume serverVolume r o      ���� 0 	serverurl 	serverURL p  w x w l  - -��������  ��  ��   x  y z y O   - ^ { | { Q   1 ] } ~�� } k   4 T    � � � Z   4 R � ��� � � I  4 <�� ���
�� .coredoexbool        obj  � 4   4 8�� �
�� 
cdis � o   6 7���� 0 servervolume serverVolume��   � r   ? D � � � l  ? B ����� � l  ? B ����� � n   ? B � � � 1   @ B��
�� 
psxp � o   ? @���� 0 servervolume serverVolume��  ��  ��  ��   � o      ���� 0 mounted_drive  ��   � k   G R � �  � � � I  G L�� ���
�� .aevtmvolnull���     TEXT � o   G H���� 0 	serverurl 	serverURL��   �  ��� � r   M R � � � l  M P ����� � l  M P ����� � n   M P � � � 1   N P��
�� 
psxp � l  M N ����� � 1   M N��
�� 
rslt��  ��  ��  ��  ��  ��   � o      ���� 0 mounted_drive  ��   �  ��� � l  S S�� � ���   � # 	display dialog mounted_drive    � � � � : 	 d i s p l a y   d i a l o g   m o u n t e d _ d r i v e��   ~ R      ������
�� .ascrerr ****      � ****��  ��  ��   | m   - . � ��                                                                                  MACS  alis    t  Macintosh HD               ѹ�rH+   l)
Finder.app                                                      n����~        ����  	                CoreServices    ѹ�R      ��o�     l) l( l'  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   z  � � � l  _ _��������  ��  ��   �  � � � l  _ _�� � ���   � 1 + NAS is now definitly mounted, start elodie    � � � � V   N A S   i s   n o w   d e f i n i t l y   m o u n t e d ,   s t a r t   e l o d i e �  � � � r   _ d � � � b   _ b � � � o   _ `���� 0 mounted_drive   � m   ` a � � � � �  / P i c t u r e s � o      ���� 0 target_directory   �  � � � r   e | � � � b   e z � � � b   e v � � � b   e t � � � b   e p � � � b   e n � � � o   e j���� 0 elodie_script   � m   j m � � � � � ,   i m p o r t   - - d e s t i n a t i o n = � o   n o���� 0 target_directory   � m   p s � � � � �    - - s o u r c e = � o   t u���� 0 posix_folder   � m   v y � � � � � Z   - - a l l o w - d u p l i c a t e s   - - t r a s h   > > / t m p / e l o d i e . t x t � o      ���� 0 cmd_line   �  � � � l  } }�� � ���   �  	display dialog cmd_line    � � � � 0 	 d i s p l a y   d i a l o g   c m d _ l i n e �  ��� � I  } ��� ���
�� .sysoexecTEXT���     TEXT � b   } � � � � m   } � � � � � � H e v a l   ` / u s r / l i b e x e c / p a t h _ h e l p e r   - s ` ;   � o   � ����� 0 cmd_line  ��  ��   c  ��� � l  � ���������  ��  ��  ��   K R      �� ���
�� .ascrerr ****      � **** � o      ���� 0 error_message  ��   L O   � � � � � k   � � � �  � � � I  � �������
�� .miscactvnull��� ��� obj ��  ��   �  ��� � I  � ��� � �
�� .sysodlogaskr        TEXT � o   � ����� 0 error_message   � �� � �
�� 
btns � J   � � � �  ��� � m   � � � � � � �  O k��   � �� � �
�� 
dflt � m   � �����  � �� ���
�� 
givu � m   � ����� x��  ��   � m   � � � ��                                                                                  MACS  alis    t  Macintosh HD               ѹ�rH+   l)
Finder.app                                                      n����~        ����  	                CoreServices    ѹ�R      ��o�     l) l( l'  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   I  ��� � l  � ���������  ��  ��  ��   7  ��� � l     ��������  ��  ��  ��       �� �  # ( - ���   � ������������ 0 elodie_script  �� 0 	im_folder  �� 0 	nas_drive  �� 0 
nas_volume  
�� .facofgetnull���     alis � � 9�~�} � ��|
� .facofgetnull���     alis�~ 0 this_folder  �} �{�z�y
�{ 
flst�z 0 these_items  �y   � �x�w�v�u�t�s�r�q�p�o�n�x 0 this_folder  �w 0 these_items  �v 0 posix_folder  �u 	0 intnt  �t 	0 paras  �s 0 servervolume serverVolume�r 0 	serverurl 	serverURL�q 0 mounted_drive  �p 0 target_directory  �o 0 cmd_line  �n 0 error_message   � �m X�l�k�j�i m u ��h�g�f�e�d�c � � � � ��b�a�` ��_�^�]�\�[
�m 
psxp
�l .sysoexecTEXT���     TEXT
�k 
cpar
�j 
nmbr�i 
�h 
cdis
�g .coredoexbool        obj 
�f .aevtmvolnull���     TEXT
�e 
rslt�d  �c  �b 0 error_message  
�a .miscactvnull��� ��� obj 
�` 
btns
�_ 
dflt
�^ 
givu�] x�\ 
�[ .sysodlogaskr        TEXT�| ���,E�O ��j E�O��-�,E�O�� hY e�E�O�%E�O� . %*�/j 
 
��,E�Y �j O��,E�OPW X  hUO��%E�Ob   a %�%a %�%a %E�Oa �%j OPW +X  � !*j O�a a kva ka a a  UOP ascr  ��ޭ
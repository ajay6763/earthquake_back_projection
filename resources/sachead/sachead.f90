PROGRAM header
USE sac_i_o
IMPLICIT NONE
REAL(KIND=4), DIMENSION(:), ALLOCATABLE :: sacfile
INTEGER(KIND=4)  :: NN, ios, J
CHARACTER(LEN=112) :: file1, variable


!    --  R E A D  U S E R  I N P U T  --
!:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:!
NN = IARGC()
IF (NN < 2) THEN
  write(*,'(a)') "usage:  sachead sacfile variable"
  write(*,'(a)') "        sacfile - input sac file"
  write(*,'(a)') "        variable - SAC header variable to read"
  STOP
ENDIF

CALL GETARG(1, file1)
OPEN(UNIT=1,FILE=file1,STATUS='OLD',IOSTAT=ios)
IF (ios > 0) THEN
  write(*,*) "ERROR - Input file: '", TRIM(adjustl(file1)), "' does not exist ..."
  CLOSE(1)
  STOP
ENDIF
CLOSE(1)

CALL GETARG(2,variable)
                                                                                
!    --  R E A D   I N P U T  S A C  F I L E S  --
!:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:!
!read file1
CALL rbsac(file1,delta,depmin,depmax,scale,odelta,b,e,o,a,internal1,         &
t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,f,resp0,resp1,resp2,resp3,resp4,resp5,resp6,   &
resp7,resp8,resp9,stla,stlo,stel,stdp,evla,evlo,evel,evdp,mag,user0,user1,   &
user2,user3,user4,user5,user6,user7,user8,user9,dist,az,baz,gcarc,internal2, &
internal3,depmen,cmpaz,cmpinc,xminimum,xmaximum,yminimum,ymaximum,unused1,   &
unused2,unused3,unused4,unused5,unused6,unused7,nzyear,nzjday,nzhour,nzmin,  &
nzsec,nzmsec,nvhdr,norid,nevid,npts,internal4,nwfid,nxsize,nysize,unused8,   &
iftype,idep,iztype,unused9,iinst,istreg,ievreg,ievtyp,iqual,isynth,imagtyp,  &
imagsrc,unused10,unused11,unused12,unused13,unused14,unused15,unused16,      &
unused17,leven,lpspol,lovrok,lcalda,unused18,kevnm,kstnm,khole,ko,ka,kt0,kt1,&
kt2,kt3,kt4,kt5,kt6,kt7,kt8,kt9,kf,kuser0,kuser1,kuser2,kcmpnm,knetwk,kdatrd,&
kinst,sacfile)
                                                                                
IF (nvhdr /= 6) THEN
  write(*,*) "ERROR - File: '", TRIM(adjustl(file1)), "' appears to be of non-native &
  &byte-order or is not a SAC file."
  STOP
ENDIF

!    --  W R I T E  S A C  V A R I A B L E  --
!:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:=====:!
  IF (variable == 'delta' .OR. variable == 'DELTA') THEN
    write(*,96)   "", delta
  ELSEIF (variable == 'depmin' .OR. variable == 'DEPMIN') THEN
    write(*,96)   "", depmin
  ELSEIF (variable == 'depmax' .OR. variable == 'DEPMAX') THEN
    write(*,96)   "", depmax
  ELSEIF (variable == 'scale' .OR. variable == 'SCALE') THEN
    write(*,96)   "", scale
  ELSEIF (variable == 'odelta' .OR. variable == 'ODELTA') THEN
    write(*,96)   "", odelta
  ELSEIF (variable == 'b' .OR. variable == 'B') THEN
    write(*,96)   "", b
  ELSEIF (variable == 'e' .OR. variable == 'E') THEN
    write(*,96)   "", e
  ELSEIF (variable == 'o' .OR. variable == 'O') THEN
    write(*,96)   "", o
  ELSEIF (variable == 'a' .OR. variable == 'A') THEN
    write(*,96)   "", a
  ELSEIF (variable == 't0' .OR. variable == 'T0') THEN
    write(*,96)   "", t0
  ELSEIF (variable == 't1' .OR. variable == 'T1') THEN
    write(*,96)   "", t1
  ELSEIF (variable == 't2' .OR. variable == 'T2') THEN
    write(*,96)   "", t2
  ELSEIF (variable == 't3' .OR. variable == 'T3') THEN
    write(*,96)   "", t3
  ELSEIF (variable == 't4' .OR. variable == 'T4') THEN
    write(*,96)   "", t4
  ELSEIF (variable == 't5' .OR. variable == 'T5') THEN
    write(*,96)   "", t5
  ELSEIF (variable == 't6' .OR. variable == 'T6') THEN
    write(*,96)   "", t6
  ELSEIF (variable == 't7' .OR. variable == 'T7') THEN
    write(*,96)   "", t7
  ELSEIF (variable == 't8' .OR. variable == 'T8') THEN
    write(*,96)   "", t8
  ELSEIF (variable == 't9' .OR. variable == 'T9') THEN
    write(*,96)   "", t9
  ELSEIF (variable == 'f' .OR. variable == 'F') THEN
    write(*,96)   "", f
  ELSEIF (variable == 'resp0' .OR. variable == 'RESP0') THEN
    write(*,96)   "", resp0
  ELSEIF (variable == 'resp1' .OR. variable == 'RESP1') THEN
    write(*,96)   "", resp1
  ELSEIF (variable == 'resp2' .OR. variable == 'RESP2') THEN
    write(*,96)   "", resp2
  ELSEIF (variable == 'resp3' .OR. variable == 'RESP3') THEN
    write(*,96)   "", resp3
  ELSEIF (variable == 'resp4' .OR. variable == 'RESP4') THEN
    write(*,96)   "", resp4
  ELSEIF (variable == 'resp5' .OR. variable == 'RESP5') THEN
    write(*,96)   "", resp5
  ELSEIF (variable == 'resp6' .OR. variable == 'RESP6') THEN
    write(*,96)   "", resp6
  ELSEIF (variable == 'resp7' .OR. variable == 'RESP7') THEN
    write(*,96)   "", resp7
  ELSEIF (variable == 'resp8' .OR. variable == 'RESP8') THEN
    write(*,96)   "", resp8
  ELSEIF (variable == 'resp9' .OR. variable == 'RESP9') THEN
    write(*,96)   "", resp9
  ELSEIF (variable == 'stla' .OR. variable == 'STLA') THEN
    write(*,96)   "", stla
  ELSEIF (variable == 'stlo' .OR. variable == 'STLO') THEN
    write(*,96)   "", stlo
  ELSEIF (variable == 'stel' .OR. variable == 'STEL') THEN
    write(*,96)   "", stel
  ELSEIF (variable == 'stdp' .OR. variable == 'STDP') THEN
    write(*,96)   "", stdp
  ELSEIF (variable == 'evla' .OR. variable == 'EVLA') THEN
    write(*,96)   "", evla
  ELSEIF (variable == 'evlo' .OR. variable == 'EVLO') THEN
    write(*,96)   "", evlo
  ELSEIF (variable == 'evel' .OR. variable == 'EVEL') THEN
    write(*,96)   "", evel
  ELSEIF (variable == 'evdp' .OR. variable == 'EVDP') THEN
    write(*,96)   "", evdp
  ELSEIF (variable == 'mag' .OR. variable == 'MAG') THEN
    write(*,96)   "", mag
  ELSEIF (variable == 'user0' .OR. variable == 'USER0') THEN
    write(*,96)   "", user0
  ELSEIF (variable == 'user1' .OR. variable == 'USER1') THEN
    write(*,96)   "", user1
  ELSEIF (variable == 'user2' .OR. variable == 'USER2') THEN
    write(*,96)   "", user2
  ELSEIF (variable == 'user3' .OR. variable == 'USER3') THEN
    write(*,96)   "", user3
  ELSEIF (variable == 'user4' .OR. variable == 'USER4') THEN
    write(*,96)   "", user4
  ELSEIF (variable == 'user5' .OR. variable == 'USER5') THEN
    write(*,96)   "", user5
  ELSEIF (variable == 'user6' .OR. variable == 'USER6') THEN
    write(*,96)   "", user6
  ELSEIF (variable == 'user7' .OR. variable == 'USER7') THEN
    write(*,96)   "", user7
  ELSEIF (variable == 'user8' .OR. variable == 'USER8') THEN
    write(*,96)   "", user8
  ELSEIF (variable == 'user9' .OR. variable == 'USER9') THEN
    write(*,96)   "", user9
  ELSEIF (variable == 'dist' .OR. variable == 'DIST') THEN
    write(*,96)   "", dist
  ELSEIF (variable == 'az' .OR. variable == 'AZ') THEN
    write(*,96)   "", az
  ELSEIF (variable == 'baz' .OR. variable == 'BAZ') THEN
    write(*,96)   "", baz
  ELSEIF (variable == 'gcarc' .OR. variable == 'GCARC') THEN
    write(*,96)   "", gcarc
  ELSEIF (variable == 'depmen' .OR. variable == 'DEPMEN') THEN
    write(*,96)   "", depmen
  ELSEIF (variable == 'cmpaz' .OR. variable == 'CMPAZ') THEN
    write(*,96)   "", cmpaz
  ELSEIF (variable == 'cmpinc' .OR. variable == 'CMPINC') THEN
    write(*,96)   "", cmpinc
  ELSEIF (variable == 'xminimum' .OR. variable == 'XMINIMUM') THEN
    write(*,96)   "", xminimum
  ELSEIF (variable == 'xmaximum' .OR. variable == 'XMAXIMUM') THEN
    write(*,96)   "", xmaximum
  ELSEIF (variable == 'yminimum' .OR. variable == 'YMINIMUM') THEN
    write(*,96)   "", yminimum
  ELSEIF (variable == 'ymaximum' .OR. variable == 'YMAXIMUM') THEN
    write(*,96)   "", ymaximum
  ELSEIF (variable == 'nzyear' .OR. variable == 'NZYEAR') THEN
    write(*,97)   "", nzyear
  ELSEIF (variable == 'nzjday' .OR. variable == 'NZJDAY') THEN
    write(*,97)   "", nzjday
  ELSEIF (variable == 'nzhour' .OR. variable == 'NZHOUR') THEN
    write(*,97)   "", nzhour
  ELSEIF (variable == 'nzmin' .OR. variable == 'NZMIN') THEN
    write(*,97)   "", nzmin
  ELSEIF (variable == 'nzsec' .OR. variable == 'NZSEC') THEN
    write(*,97)   "", nzsec
  ELSEIF (variable == 'nzmsec' .OR. variable == 'NZMSEC') THEN
    write(*,97)   "", nzmsec
  ELSEIF (variable == 'nvhdr' .OR. variable == 'NVHDR') THEN
    write(*,97)   "", nvhdr
  ELSEIF (variable == 'norid' .OR. variable == 'NORID') THEN
    write(*,97)   "", norid
  ELSEIF (variable == 'nevid' .OR. variable == 'NEVID') THEN
    write(*,97)   "", nevid
  ELSEIF (variable == 'npts' .OR. variable == 'NPTS') THEN
    write(*,97)   "", npts
  ELSEIF (variable == 'nwfid' .OR. variable == 'NWFID') THEN
    write(*,97)   "", nwfid
  ELSEIF (variable == 'nxsize' .OR. variable == 'NXSIZE') THEN
    write(*,97)   "", nxsize
  ELSEIF (variable == 'nysize' .OR. variable == 'NYSIZE') THEN
    write(*,97)   "", nysize
  ELSEIF (variable == 'iftype' .OR. variable == 'IFTYPE') THEN
    write(*,97)   "", iftype
  ELSEIF (variable == 'iinst' .OR. variable == 'IINST') THEN
    write(*,97)   "", iinst
  ELSEIF (variable == 'istreg' .OR. variable == 'ISTREG') THEN
    write(*,97)   "", istreg
  ELSEIF (variable == 'ievreg' .OR. variable == 'IEVREG') THEN
    write(*,97)   "", ievreg
  ELSEIF (variable == 'ievtyp' .OR. variable == 'IEVTYP') THEN
    write(*,97)   "", ievtyp
  ELSEIF (variable == 'iqual' .OR. variable == 'IQUAL') THEN
    write(*,97)   "", iqual
  ELSEIF (variable == 'isynth' .OR. variable == 'ISYNTH') THEN
    write(*,97)   "", isynth
  ELSEIF (variable == 'imagtyp' .OR. variable == 'IMAGTYP') THEN
    write(*,97)   "", imagtyp
  ELSEIF (variable == 'imagsrc' .OR. variable == 'IMAGSRC') THEN
    write(*,97)   "", imagsrc
  ELSEIF (variable == 'leven' .OR. variable == 'LEVEN') THEN
    write(*,97)   "", leven
  ELSEIF (variable == 'lpspol' .OR. variable == 'LPSPOL') THEN
    write(*,97)   "", lpspol
  ELSEIF (variable == 'lovrok' .OR. variable == 'LOVROK') THEN
    write(*,97)   "", lovrok
  ELSEIF (variable == 'lcalda' .OR. variable == 'LCALDA') THEN
    write(*,97)   "", lcalda
  ELSEIF (variable == 'kevnm' .OR. variable == 'KEVNM') THEN
    write(*,99)   "", kevnm
  ELSEIF (variable == 'kstnm' .OR. variable == 'KSTNM') THEN
    write(*,98)   "", kstnm
  ELSEIF (variable == 'khole' .OR. variable == 'KHOLE') THEN
    write(*,98)   "", khole
  ELSEIF (variable == 'ko' .OR. variable == 'KO') THEN
    write(*,98)   "", ko
  ELSEIF (variable == 'ka' .OR. variable == 'KA') THEN
    write(*,98)   "", ka
  ELSEIF (variable == 'kt0' .OR. variable == 'KT0') THEN
    write(*,98)   "", kt0
  ELSEIF (variable == 'kt1' .OR. variable == 'KT1') THEN
    write(*,98)   "", kt1
  ELSEIF (variable == 'kt2' .OR. variable == 'KT2') THEN
    write(*,98)   "", kt2
  ELSEIF (variable == 'kt3' .OR. variable == 'KT3') THEN
    write(*,98)   "", kt3
  ELSEIF (variable == 'kt4' .OR. variable == 'KT4') THEN
    write(*,98)   "", kt4
  ELSEIF (variable == 'kt5' .OR. variable == 'KT5') THEN
    write(*,98)   "", kt5
  ELSEIF (variable == 'kt6' .OR. variable == 'KT6') THEN
    write(*,98)   "", kt6
  ELSEIF (variable == 'kt7' .OR. variable == 'KT7') THEN
    write(*,98)   "", kt7
  ELSEIF (variable == 'kt8' .OR. variable == 'KT8') THEN
    write(*,98)   "", kt8
  ELSEIF (variable == 'kt9' .OR. variable == 'KT9') THEN
    write(*,98)   "", kt9
  ELSEIF (variable == 'kf' .OR. variable == 'KF') THEN
    write(*,98)   "", kf
  ELSEIF (variable == 'kuser0' .OR. variable == 'KUSER0') THEN
    write(*,98)   "", kuser0
  ELSEIF (variable == 'kuser1' .OR. variable == 'KUSER1') THEN
    write(*,98)   "", kuser1
  ELSEIF (variable == 'kuser2' .OR. variable == 'KUSER2') THEN
    write(*,98)   "", kuser2
  ELSEIF (variable == 'kcmpnm' .OR. variable == 'KCMPNM') THEN
    write(*,98)   "", kcmpnm
  ELSEIF (variable == 'knetwk' .OR. variable == 'KNETWK') THEN
    write(*,98)   "", knetwk
  ELSEIF (variable == 'kdatrd' .OR. variable == 'KDATRD') THEN
    write(*,98)   "", kdatrd
  ELSEIF (variable == 'kinst' .OR. variable == 'KINST') THEN
    write(*,98)   "", kinst
  ELSE
    write(*,*) "ERROR - Variable: '",TRIM(adjustl(variable)), "' does not exist ..."
  ENDIF

96 FORMAT(A,F15.7)
97 FORMAT(A,5I10)
98 FORMAT(A,A8)
99 FORMAT(A,A16)

END PROGRAM header

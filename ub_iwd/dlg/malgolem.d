ADD_TRANS_ACTION DMALASIM BEGIN  9 END BEGIN END ~AddexperienceParty(35000)~ // deactivate
ADD_TRANS_ACTION DMALASIM BEGIN 10 END BEGIN END ~AddexperienceParty(45000)~ // turn against

APPEND DMALAVON

  IF WEIGHT #-1 ~GlobalLT("IRON_GOLEM_DEAD","GLOBAL",2)~ THEN BEGIN TurnedGolems SAY @102 // in case golems were deactivated/turned and then killed anyway
    COPY_TRANS DMALAVON 0
  END

END

EXTEND_BOTTOM dmalasim 1 2 7
  IF ~Global("Golem_Commands","GLOBAL",1)CheckStatLT(Protagonist,9,INT)~ THEN REPLY #10509 DO ~Enemy()~ GOTO 8
  IF ~Global("Golem_Commands","GLOBAL",1)CheckStatGT(Protagonist,8,INT)CheckStatLT(Protagonist,16,INT)~ THEN REPLY #10510 DO ~AddexperienceParty(35000)
SetGlobal("Golem_Commands","GLOBAL",2)Enemy()~ GOTO 9
  IF ~Global("Golem_Commands","GLOBAL",1)CheckStatGT(Protagonist,15,INT)~ THEN REPLY #10511 DO ~AddexperienceParty(45000)
SetGlobal("Golem_Commands","GLOBAL",3)Enemy()~ GOTO 10
END
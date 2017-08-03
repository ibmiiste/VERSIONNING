    -->>PRE-COMPILER<<                                              */
    --  >>CRTCMD<<  RUNSQLSTM SRCFILE(&SL/&SF) SRCMBR(&SM);         */
    --  >>IMPORTANT<<                                               */
    --    >>PARM<<  COMMIT(*NONE);                                  */
    --    >>PARM<<  NAMING(*SQL);                                   */
    --    >>PARM<<  DFTRDBCOL(&SL);                                 */
    --  >>END-IMPORTANT<<                                           */
    --  >>EXECUTE<<                                                 */
    -->>END-PRE-COMPILER<<                                          */
set schema=olivier1;

BEGIN
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN END;
   DROP TABLE ORDONNANCE;
END; 

CREATE TABLE ORDONNANCE(
    UUID ROWID GENERATED ALWAYS,
    ordre DEC(10) NOT NULL DEFAULT 0,
    Type_source FOR COLUMN TYPSRC CHAR(10) CCSID 1147 NOT NULL DEFAULT '')
    RCDFMT ORDONNANCF;

LABEL ON TABLE ORDONNANCE IS 'VERSIONNING - ORDONNANCEMENT';

LABEL ON COLUMN ORDONNANCE(
                            UUID IS 'Identifiant',
                            ordre IS 'Ordonnancement',
                            Type_source IS 'Type                de source');

LABEL ON COLUMN ORDONNANCE(
                             UUID TEXT IS 'Identifiant',
                             ordre TEXT IS 'Ordre des compilatations par type',
                             Type_source TEXT IS 'Type de source');

GRANT SELECT ON ORDONNANCE TO PUBLIC;

GRANT ALTER,
      DELETE,
      INDEX,
      INSERT,
      REFERENCES,
      SELECT,
      UPDATE ON ORDONNANCE TO QPGMR
    WITH GRANT OPTION;
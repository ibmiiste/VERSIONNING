      /if defined(*CRTBNDRPG)
       ctl-opt dftactgrp(*no) ACTGRP(*NEW);
      /endif

       ctl-opt datedit(*ymd);
       ctl-opt option(*nodebugio:*srcstmt:*NOUNREF) CCSIDCVT(*LIST);
       ctl-opt bnddir('MIRUS_BND':'SERVICE');

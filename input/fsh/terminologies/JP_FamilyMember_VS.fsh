ValueSet: JP_FamilyMember_VS
Id: jp-family-member-vs
Title: "JP Core Family Member ValueSet"
Description: "家族関係における対象となる両者の続柄"
* ^url = $JP_FamilyMember_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-10-15"
* ^copyright = "This material derives from the HL7 Terminology THO. THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information."
* ^publisher = "一般社団法人日本医療情報学会NeXEHRS課題研究会FHIR日本実装ワーキンググループ"
* include codes from system $v3_RoleCode where concept is-a #FAMMEMB

* $v3_RoleCode#FAMMEMB "家族"
  * $v3_RoleCode#CHILD "子供"
    * $v3_RoleCode#CHLDADOPT "養子"
      * $v3_RoleCode#DAUADOPT "養女"
      * $v3_RoleCode#SONADOPT "養子（男子）"
    * $v3_RoleCode#CHLDFOST "里子"
      * $v3_RoleCode#DAUFOST "里子（女子）"
      * $v3_RoleCode#SONFOST "里子（男子）"
    * $v3_RoleCode#DAUC "娘"
      * $v3_RoleCode#DAU "実娘"
      * $v3_RoleCode#STPDAU "継娘"
    * $v3_RoleCode#NCHILD "実子"
      * $v3_RoleCode#SON "実息子"
    * $v3_RoleCode#SONC "息子"
      * $v3_RoleCode#STPSON "継息子"
    * $v3_RoleCode#STPCHLD "継子"
  * $v3_RoleCode#EXT "親族（直系血族を除く）"
    * $v3_RoleCode#AUNT "伯母（叔母）"
      * $v3_RoleCode#MAUNT "母方の伯母（叔母）"
      * $v3_RoleCode#PAUNT "父方の伯母（叔母）"
    * $v3_RoleCode#COUSN "いとこ"
      * $v3_RoleCode#MCOUSN "母方のいとこ"
      * $v3_RoleCode#PCOUSN "父方のいとこ"
    * $v3_RoleCode#GGRPRN "曽祖父母"
      * $v3_RoleCode#GGRFTH "曽祖父"
        * $v3_RoleCode#MGGRFTH "母方の曽祖父"
        * $v3_RoleCode#PGGRFTH "父方の曽祖父"
      * $v3_RoleCode#GGRMTH "曾祖母"
        * $v3_RoleCode#MGGRMTH "母方の曾祖母"
        * $v3_RoleCode#PGGRMTH "父方の曾祖母"
      * $v3_RoleCode#MGGRPRN "母方の曽祖父母"
      * $v3_RoleCode#PGGRPRN "父方の曽祖父母"
    * $v3_RoleCode#GRNDCHILD "孫"
      * $v3_RoleCode#GRNDDAU "孫娘"
      * $v3_RoleCode#GRNDSON "孫息子"
    * $v3_RoleCode#GRPRN "祖父母"
      * $v3_RoleCode#GRFTH "祖父"
        * $v3_RoleCode#MGRFTH "母方の祖父"
        * $v3_RoleCode#PGRFTH "父方の祖父"
      * $v3_RoleCode#GRMTH "祖母"
        * $v3_RoleCode#MGRMTH "母方の祖母"
        * $v3_RoleCode#PGRMTH "父方の祖母"
      * $v3_RoleCode#MGRPRN "母方の祖父母"
      * $v3_RoleCode#PGRPRN "父方の祖父母"
    * $v3_RoleCode#INLAW "義理"
      * $v3_RoleCode#CHLDINLAW "義理の子供"
        * $v3_RoleCode#DAUINLAW "義理の娘"
        * $v3_RoleCode#SONINLAW "義理の息子"
      * $v3_RoleCode#PRNINLAW "義理の親"
        * $v3_RoleCode#FTHINLAW "義理の父"
        * $v3_RoleCode#MTHINLAW "義理の母"
      * $v3_RoleCode#SIBINLAW "義理の兄弟"
        * $v3_RoleCode#BROINLAW "義理の兄"
        * $v3_RoleCode#SISINLAW "義理の姉"
    * $v3_RoleCode#NIENEPH "甥姪"
      * $v3_RoleCode#NEPHEW "甥"
      * $v3_RoleCode#NIECE "姪"
    * $v3_RoleCode#UNCLE "伯父（叔父）"
      * $v3_RoleCode#MUNCLE "母方の伯父（叔父）"
      * $v3_RoleCode#PUNCLE "父方の伯父（叔父）"
  * $v3_RoleCode#PRN "親"
    * $v3_RoleCode#ADOPTP "養父母"
      * $v3_RoleCode#ADOPTF "養父"
      * $v3_RoleCode#ADOPTM "養子母"
    * $v3_RoleCode#FTH "父"
      * $v3_RoleCode#FTHFOST "養父"
      * $v3_RoleCode#NFTH "実父"
        * $v3_RoleCode#NFTHF "胎児の実父"
      * $v3_RoleCode#STPFTH "継父"
    * $v3_RoleCode#MTH "母親"
      * $v3_RoleCode#GESTM "代理の母"
      * $v3_RoleCode#MTHFOST "養母"
      * $v3_RoleCode#NMTH "実母"
        * $v3_RoleCode#NMTHF "胎児の実母"
      * $v3_RoleCode#STPMTH "継母"
    * $v3_RoleCode#NPRN "実の親"
    * $v3_RoleCode#PRNFOST "里親"
    * $v3_RoleCode#STPPRN "継親"
  * $v3_RoleCode#SIB "同胞（兄弟姉妹）"
    * $v3_RoleCode#BRO "兄弟"
      * $v3_RoleCode#HBRO "半同胞の兄弟"
      * $v3_RoleCode#NBRO "実の兄弟（完全同胞の兄弟）"
        * $v3_RoleCode#TWINBRO "双子の兄弟"
          * $v3_RoleCode#FTWINBRO "二卵性双生児の兄弟"
          * $v3_RoleCode#ITWINBRO "一卵性双生児の兄弟"
      * $v3_RoleCode#STPBRO "義理の兄弟"
    * $v3_RoleCode#HSIB "半同胞"
      * $v3_RoleCode#HSIS "半同胞の姉妹"
    * $v3_RoleCode#NSIB "完全同胞"
      * $v3_RoleCode#NSIS "実の姉妹（完全同胞の姉妹）"
        * $v3_RoleCode#TWINSIS "双子の姉妹"
          * $v3_RoleCode#FTWINSIS "二卵性双生児姉妹"
          * $v3_RoleCode#ITWINSIS "一卵性双生児姉妹"
      * $v3_RoleCode#TWIN "双子"
        * $v3_RoleCode#FTWIN "二卵性双生児"
        * $v3_RoleCode#ITWIN "一卵性双生児"
    * $v3_RoleCode#SIS "姉妹"
      * $v3_RoleCode#STPSIS "継姉妹"
    * $v3_RoleCode#STPSIB "継親の子"
  * $v3_RoleCode#SIGOTHR "重要なパートナー"
    * $v3_RoleCode#DOMPART "内縁のパートナー"
    * $v3_RoleCode#FMRSPS "元配偶者"
    * $v3_RoleCode#SPS "配偶者"
      * $v3_RoleCode#HUSB "夫"
      * $v3_RoleCode#WIFE "妻"
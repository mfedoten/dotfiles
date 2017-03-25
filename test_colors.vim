-- INSERT --


SpecialKey     xxx term=bold ctermfg=244 ctermbg=236 guifg=#808080 guibg=#343434
EndOfBuffer    xxx links to NonText
NonText        xxx term=bold ctermfg=244 ctermbg=234 guifg=#808080 guibg=#202020
Directory      xxx term=bold ctermfg=159 guifg=Cyan
ErrorMsg       xxx term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
IncSearch      xxx term=reverse cterm=reverse gui=reverse
Search         xxx term=reverse ctermfg=234 ctermbg=214 guifg=#1c1c1c guibg=#cc7a00
MoreMsg        xxx term=bold ctermfg=22 guifg=#008700
ModeMsg        xxx term=bold cterm=bold gui=bold
LineNr         xxx term=underline ctermfg=244 ctermbg=234 guifg=#4d4d4d guibg=#202020
CursorLineNr   xxx term=bold ctermfg=208 gui=bold guifg=#ff9806
Question       xxx term=standout ctermfg=22 guifg=#008700
StatusLine     xxx term=bold,reverse cterm=bold,reverse ctermfg=253 ctermbg=238 guifg=#d3d3d5 guibg=#303030
StatusLineNC   xxx term=reverse cterm=reverse ctermfg=246 ctermbg=238 guifg=#939395 guibg=#303030
VertSplit      xxx term=reverse cterm=reverse ctermfg=238 ctermbg=238 guifg=#444444 guibg=#303030
Title          xxx term=bold cterm=bold ctermfg=254 gui=bold guifg=#f6f3e8
Visual         xxx term=reverse ctermfg=229 ctermbg=238 guifg=#faf4c6 guibg=#3c414c
VisualNOS      xxx term=bold,underline cterm=bold,underline gui=bold,underline
WarningMsg     xxx term=standout ctermfg=224 guifg=Red
WildMenu       xxx term=standout cterm=standout ctermfg=0 ctermbg=215 gui=bold guifg=#202020 guibg=#ffb380
Folded         xxx term=standout ctermfg=248 ctermbg=236 guifg=#a0a8b0 guibg=#2c333a
FoldColumn     xxx term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
DiffAdd        xxx term=bold cterm=reverse ctermfg=108 ctermbg=235 gui=reverse guifg=#87af87 guibg=#262626
DiffChange     xxx term=bold cterm=reverse ctermfg=103 ctermbg=235 gui=reverse guifg=#8787af guibg=#262626
DiffDelete     xxx term=bold cterm=reverse ctermfg=131 ctermbg=235 gui=reverse guifg=#af5f5f guibg=#262626
DiffText       xxx term=reverse cterm=reverse ctermfg=208 ctermbg=235 gui=reverse guifg=#ff9806 guibg=#262626
SignColumn     xxx term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
Conceal        xxx ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
SpellBad       xxx term=reverse cterm=underline ctermfg=1 gui=undercurl guisp=Red
SpellCap       xxx term=reverse cterm=underline ctermfg=27 gui=undercurl guisp=Blue
SpellRare      xxx term=reverse cterm=underline ctermfg=13 gui=undercurl guisp=Magenta
SpellLocal     xxx term=underline cterm=underline ctermfg=14 gui=undercurl guisp=Cyan
Pmenu          xxx ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#202020
PmenuSel       xxx ctermfg=0 ctermbg=148 guifg=#000000 guibg=#b1d631
PmenuSbar      xxx ctermbg=248 guibg=Grey
PmenuThumb     xxx ctermbg=15 guibg=White
TabLine        xxx term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
TabLineSel     xxx term=bold cterm=bold gui=bold
TabLineFill    xxx term=reverse cterm=reverse gui=reverse
CursorColumn   xxx term=reverse ctermbg=234 guibg=#202020
CursorLine     xxx term=underline cterm=underline ctermbg=234 guibg=#202020
ColorColumn    xxx term=reverse ctermbg=233 guibg=#1a1a1a
Cursor         xxx ctermbg=241 guibg=#626262
lCursor        xxx guifg=bg guibg=fg
MatchParen     xxx term=reverse cterm=bold ctermfg=157 ctermbg=237 gui=bold guifg=#d0ffc0 guibg=#202020
Normal         xxx ctermfg=253 ctermbg=234 guifg=#e2e2e5 guibg=#202020
Error          xxx term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
Comment        xxx term=bold cterm=italic ctermfg=244 gui=italic guifg=#595959
Constant       xxx term=underline ctermfg=208 guifg=#ff9806
Special        xxx term=bold ctermfg=208 guifg=#ff9806
Identifier     xxx term=underline cterm=bold ctermfg=250 guifg=#bfbfbf
Statement      xxx term=bold ctermfg=241 guifg=#7e8aa2
PreProc        xxx term=underline ctermfg=229 guifg=#f9f1b9
Type           xxx term=underline ctermfg=103 guifg=#8787af
Underlined     xxx term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
Ignore         xxx ctermfg=0 guifg=bg
Todo           xxx term=standout cterm=bold ctermfg=159 ctermbg=238 gui=bold guifg=#20f8f8 guibg=#333333
String         xxx ctermfg=168 guifg=#d75f87
Character      xxx links to Constant
Number         xxx ctermfg=215 guifg=#ffb380
Boolean        xxx ctermfg=148 guifg=#b1d631
Float          xxx links to Number
Function       xxx ctermfg=103 guifg=#7488c3
Conditional    xxx links to Statement
Repeat         xxx links to Statement
Label          xxx links to Statement
Operator       xxx links to Statement
Keyword        xxx ctermfg=208 guifg=#ff9806
Exception      xxx links to Statement
Include        xxx links to PreProc
Define         xxx links to PreProc
Macro          xxx links to PreProc
PreCondit      xxx links to PreProc
StorageClass   xxx links to Type
Structure      xxx links to Type
Typedef        xxx links to Type
Tag            xxx links to Special
SpecialChar    xxx links to Special
Delimiter      xxx links to Special
SpecialComment xxx links to Special
Debug          xxx links to Special
pythonImport   xxx ctermfg=255 guifg=#009000
pythonException xxx ctermfg=160 guifg=#f00000
pythonOperator xxx ctermfg=103 guifg=#7e8aa2
pythonExClass  xxx ctermfg=200 guifg=#009000
pythonBuiltinFunction xxx ctermfg=200 guifg=#009000
SyntasticError xxx links to SpellBad
SyntasticWarning xxx links to SpellCap
SyntasticStyleError xxx links to SyntasticError
SyntasticStyleWarning xxx links to SyntasticWarning
vimTodo        xxx links to Todo
vimCommand     xxx links to Statement
vimStdPlugin   xxx cleared
vimOption      xxx links to PreProc
vimErrSetting  xxx links to vimError
vimAutoEvent   xxx links to Type
vimGroup       xxx links to Type
vimHLGroup     xxx links to vimGroup
vimFuncName    xxx links to Function
vimGlobal      xxx cleared
vimSubst       xxx links to vimCommand
vimNumber      xxx links to Number
vimAddress     xxx links to vimMark
vimAutoCmd     xxx links to vimCommand
vimIsCommand   xxx cleared
vimExtCmd      xxx cleared
vimFilter      xxx cleared
vimLet         xxx links to vimCommand
vimMap         xxx links to vimCommand
vimMark        xxx links to Number
vimSet         xxx cleared
vimSyntax      xxx links to vimCommand
vimUserCmd     xxx cleared
vimCmdSep      xxx cleared
vimVar         xxx links to Identifier
vimFBVar       xxx links to vimVar
vimInsert      xxx links to vimString
vimBehaveModel xxx links to vimBehave
vimBehaveError xxx links to vimError
vimBehave      xxx links to vimCommand
vimFTCmd       xxx links to vimCommand
vimFTOption    xxx links to vimSynType
vimFTError     xxx links to vimError
vimFiletype    xxx cleared
vimAugroup     xxx cleared
vimExecute     xxx cleared
vimNotFunc     xxx links to vimCommand
vimFunction    xxx cleared
vimFunctionError xxx links to vimError
vimLineComment xxx links to vimComment
vimSpecFile    xxx links to Identifier
vimOper        xxx links to Operator
vimOperParen   xxx cleared
vimComment     xxx links to Comment
vimString      xxx links to String
vimRegister    xxx links to SpecialChar
vimCmplxRepeat xxx links to SpecialChar
vimRegion      xxx cleared
vimSynLine     xxx cleared
vimNotation    xxx links to Special
vimCtrlChar    xxx links to SpecialChar
vimFuncVar     xxx links to Identifier
vimContinue    xxx links to Special
vimAugroupKey  xxx links to vimCommand
vimAugroupError xxx links to vimError
vimEnvvar      xxx links to PreProc
vimFunc        xxx links to vimError
vimParenSep    xxx links to Delimiter
vimSep         xxx links to Delimiter
vimOperError   xxx links to Error
vimFuncKey     xxx links to vimCommand
vimFuncSID     xxx links to Special
vimAbb         xxx links to vimCommand
vimEcho        xxx cleared
vimEchoHL      xxx links to vimCommand
vimIf          xxx cleared
vimHighlight   xxx links to vimCommand
vimNorm        xxx links to vimCommand
vimUnmap       xxx links to vimMap
vimUserCommand xxx links to vimCommand
vimFuncBody    xxx cleared
vimFuncBlank   xxx cleared
vimPattern     xxx links to Type
vimSpecFileMod xxx links to vimSpecFile
vimEscapeBrace xxx cleared
vimSetEqual    xxx cleared
vimSetString   xxx links to vimString
vimSubstRep    xxx cleared
vimSubstRange  xxx cleared
vimUserAttrb   xxx links to vimSpecial
vimUserAttrbError xxx links to Error
vimUserAttrbKey xxx links to vimOption
vimUserAttrbCmplt xxx links to vimSpecial
vimUserCmdError xxx links to Error
vimUserAttrbCmpltFunc xxx links to Special
vimCommentString xxx links to vimString
vimPatSepErr   xxx links to vimPatSep
vimPatSep      xxx links to SpecialChar
vimPatSepZ     xxx links to vimPatSep
vimPatSepZone  xxx links to vimString
vimPatSepR     xxx links to vimPatSep
vimPatRegion   xxx cleared
vimNotPatSep   xxx links to vimString
vimStringCont  xxx links to vimString
vimSubstTwoBS  xxx links to vimString
vimSubstSubstr xxx links to SpecialChar
vimCollection  xxx cleared
vimSubstPat    xxx cleared
vimSubst1      xxx links to vimSubst
vimSubstDelim  xxx links to Delimiter
vimSubstRep4   xxx cleared
vimSubstFlagErr xxx links to vimError
vimCollClass   xxx cleared
vimCollClassErr xxx links to vimError
vimSubstFlags  xxx links to Special
vimMarkNumber  xxx links to vimNumber
vimPlainMark   xxx links to vimMark
vimPlainRegister xxx links to vimRegister
vimSetMod      xxx links to vimOption
vimSetSep      xxx links to Statement
vimMapMod      xxx links to vimBracket
vimMapLhs      xxx cleared
vimAutoCmdSpace xxx cleared
vimAutoEventList xxx cleared
vimAutoCmdSfxList xxx cleared
vimEchoHLNone  xxx links to vimGroup
vimMapBang     xxx links to vimCommand
vimMapRhs      xxx cleared
vimMapModKey   xxx links to vimFuncSID
vimMapModErr   xxx links to vimError
vimMapRhsExtend xxx cleared
vimMenuBang    xxx cleared
vimMenuPriority xxx cleared
vimMenuName    xxx links to PreProc
vimMenuMod     xxx links to vimMapMod
vimMenuNameMore xxx links to vimMenuName
vimMenuMap     xxx cleared
vimMenuRhs     xxx cleared
vimBracket     xxx links to Delimiter
vimUserFunc    xxx links to Normal
vimElseIfErr   xxx links to Error
vimBufnrWarn   xxx links to vimWarn
vimNormCmds    xxx cleared
vimGroupSpecial xxx links to Special
vimGroupList   xxx cleared
vimSynError    xxx links to Error
vimSynContains xxx links to vimSynOption
vimSynKeyContainedin xxx links to vimSynContains
vimSynNextgroup xxx links to vimSynOption
vimSynType     xxx links to vimSpecial
vimAuSyntax    xxx cleared
vimSynCase     xxx links to Type
vimSynCaseError xxx links to vimError
vimClusterName xxx cleared
vimGroupName   xxx links to vimGroup
vimGroupAdd    xxx links to vimSynOption
vimGroupRem    xxx links to vimSynOption
vimIskList     xxx cleared
vimIskSep      xxx links to Delimiter
vimSynKeyOpt   xxx links to vimSynOption
vimSynKeyRegion xxx cleared
vimMtchComment xxx links to vimComment
vimSynMtchOpt  xxx links to vimSynOption
vimSynRegPat   xxx links to vimString
vimSynMatchRegion xxx cleared
vimSynMtchCchar xxx cleared
vimSynMtchGroup xxx cleared
vimSynPatRange xxx links to vimString
vimSynNotPatRange xxx links to vimSynRegPat
vimSynRegOpt   xxx links to vimSynOption
vimSynReg      xxx links to Type
vimSynMtchGrp  xxx links to vimSynOption
vimSynRegion   xxx cleared
vimSynPatMod   xxx cleared
vimSyncC       xxx links to Type
vimSyncLines   xxx cleared
vimSyncMatch   xxx cleared
vimSyncError   xxx links to Error
vimSyncLinebreak xxx cleared
vimSyncLinecont xxx cleared
vimSyncRegion  xxx cleared
vimSyncGroupName xxx links to vimGroupName
vimSyncKey     xxx links to Type
vimSyncGroup   xxx links to vimGroupName
vimSyncNone    xxx links to Type
vimHiLink      xxx cleared
vimHiClear     xxx links to vimHighlight
vimHiKeyList   xxx cleared
vimHiCtermError xxx links to vimError
vimHiBang      xxx cleared
vimHiGroup     xxx links to vimGroupName
vimHiAttrib    xxx links to PreProc
vimFgBgAttrib  xxx links to vimHiAttrib
vimHiAttribList xxx links to vimError
vimHiCtermColor xxx cleared
vimHiFontname  xxx cleared
vimHiGuiFontname xxx cleared
vimHiGuiRgb    xxx links to vimNumber
vimHiTerm      xxx links to Type
vimHiCTerm     xxx links to vimHiTerm
vimHiStartStop xxx links to vimHiTerm
vimHiCtermFgBg xxx links to vimHiTerm
vimHiGui       xxx links to vimHiTerm
vimHiGuiFont   xxx links to vimHiTerm
vimHiGuiFgBg   xxx links to vimHiTerm
vimHiKeyError  xxx links to vimError
vimHiTermcap   xxx cleared
vimHiNmbr      xxx links to Number
vimCommentTitle xxx links to PreProc
vimCommentTitleLeader xxx cleared
vimSearchDelim xxx links to Statement
vimSearch      xxx links to vimString
luaTodo        xxx links to Todo
luaComment     xxx links to Comment
luaInnerComment xxx cleared
luaParenError  xxx links to Error
luaSpecial     xxx links to SpecialChar
luaIfThen      xxx cleared
luaElseifThen  xxx cleared
luaElse        xxx links to Conditional
luaThenEnd     xxx cleared
luaBlock       xxx cleared
luaLoopBlock   xxx cleared
luaIn          xxx links to Operator
luaStatement   xxx links to Statement
luaParen       xxx cleared
luaTable       xxx links to Structure
luaBraceError  xxx links to Error
luaTableBlock  xxx cleared
luaError       xxx links to Error
luaFunction    xxx links to Function
luaFunctionBlock xxx cleared
luaCond        xxx links to Conditional
luaRepeat      xxx links to Repeat
luaLabel       xxx links to Label
luaOperator    xxx links to Operator
luaConstant    xxx links to Constant
luaString2     xxx links to String
luaString      xxx links to String
luaNumber      xxx links to Number
luaFunc        xxx links to Identifier
luaFor         xxx links to Repeat
vimScriptDelim xxx links to Comment
vimLuaRegion   xxx cleared
podCmdText     xxx links to String
podCommand     xxx links to Statement
podOverIndent  xxx links to Number
podForKeywd    xxx links to Identifier
podFormat      xxx links to Identifier
podVerbatimLine xxx links to PreProc
podSpecial     xxx links to Identifier
podEscape      xxx links to String
podEscape2     xxx links to Number
podBoldItalic  xxx cleared
podBoldOpen    xxx cleared
podBoldAlternativeDelimOpen xxx cleared
podItalicBold  xxx cleared
podItalicOpen  xxx cleared
podItalicAlternativeDelimOpen xxx cleared
podNoSpaceOpen xxx cleared
podNoSpaceAlternativeDelimOpen xxx cleared
podIndexOpen   xxx cleared
podIndexAlternativeDelimOpen xxx cleared
podBold        xxx cleared
podBoldAlternativeDelim xxx cleared
podItalic      xxx cleared
podItalicAlternativeDelim xxx cleared
perlTodo       xxx links to Todo
perlPOD        xxx links to perlComment
perlBraces     xxx cleared
perlConditional xxx links to Conditional
perlElseIfError xxx links to Error
perlRepeat     xxx links to Repeat
perlOperator   xxx links to Operator
perlFakeGroup  xxx cleared
perlControl    xxx links to PreProc
perlStatementStorage xxx links to perlStatement
perlStatementControl xxx links to perlStatement
perlStatementScalar xxx links to perlStatement
perlStatementRegexp xxx links to perlStatement
perlStatementNumeric xxx links to perlStatement
perlStatementList xxx links to perlStatement
perlStatementHash xxx links to perlStatement
perlStatementIOfunc xxx links to perlStatement
perlFiledescStatementNocomma xxx cleared
perlStatementFiledesc xxx links to perlStatement
perlFiledescStatementComma xxx cleared
perlStatementVector xxx links to perlStatement
perlStatementFiles xxx links to perlStatement
perlStatementFlow xxx links to perlStatement
perlStatementInclude xxx links to perlStatement
perlStatementProc xxx links to perlStatement
perlStatementSocket xxx links to perlStatement
perlStatementIPC xxx links to perlStatement
perlStatementNetwork xxx links to perlStatement
perlStatementPword xxx links to perlStatement
perlStatementTime xxx links to perlStatement
perlStatementMisc xxx links to perlStatement
perlStatementIndirObj xxx links to perlStatement
perlStatementIndirObjWrap xxx cleared
perlLabel      xxx links to Label
perlVarPlain   xxx links to perlIdentifier
perlVarNotInMatches xxx links to perlIdentifier
perlVarSlash   xxx links to perlIdentifier
perlPackageRef xxx links to perlType
perlVarMember  xxx cleared
perlVarSimpleMember xxx links to perlIdentifier
perlMethod     xxx links to perlIdentifier
perlVarPlain2  xxx links to perlIdentifier
perlFunctionName xxx links to perlIdentifier
perlVarBlock   xxx cleared
perlVarBlock2  xxx cleared
perlShellCommand xxx links to perlString
perlFloat      xxx links to Float
perlNumber     xxx links to Number
perlStringUnexpanded xxx links to perlString
perlString     xxx links to String
perlQQ         xxx links to perlString
perlArrow      xxx links to perlIdentifier
perlVarSimpleMemberName xxx links to perlString
perlPackageConst xxx cleared
perlFiledescRead xxx links to perlIdentifier
perlFiledescStatement xxx links to perlIdentifier
perlSpecialString xxx links to perlSpecial
NONE           xxx cleared
perlSpecialStringU2 xxx links to perlString
perlSpecialStringU xxx links to perlSpecial
perlSpecialMatch xxx links to perlSpecial
perlNotEmptyLine xxx links to Error
perlMatchStartEnd xxx links to perlStatement
perlVStringV   xxx links to perlStringStartEnd
perlParensSQ   xxx links to perlString
perlBracketsSQ xxx links to perlString
perlBracesSQ   xxx links to perlString
perlAnglesSQ   xxx links to perlString
perlParensDQ   xxx links to perlString
perlBracketsDQ xxx links to perlString
perlBracesDQ   xxx links to perlString
perlAnglesDQ   xxx links to perlString
perlMatch      xxx links to perlString
perlComment    xxx links to Comment
perlSubstitutionGQQ xxx links to perlString
perlSubstitutionSQ xxx links to perlString
perlTranslationGQ xxx links to perlString
perlStringStartEnd xxx links to perlString
perlHereDoc    xxx links to perlString
perlAutoload   xxx cleared
perlStatementPackage xxx links to perlStatement
perlPackageDecl xxx links to perlType
perlSubError   xxx links to Error
perlSubAttributesCont xxx links to perlSubAttributes
perlSubAttributes xxx links to PreProc
perlSubPrototypeError xxx links to Error
perlSubPrototype xxx links to Type
perlSubName    xxx links to Function
perlFunction   xxx links to Keyword
perlFunctionPRef xxx links to perlType
perlSharpBang  xxx links to PreProc
perlFormatName xxx links to perlIdentifier
perlFormatField xxx links to perlString
perlFormat     xxx cleared
perlDATA       xxx links to perlComment
perlInclude    xxx links to Include
perlSpecial    xxx links to Special
perlCharacter  xxx links to Character
perlType       xxx links to Type
perlIdentifier xxx links to Identifier
perlStatement  xxx links to Statement
perlList       xxx links to perlStatement
perlMisc       xxx links to perlStatement
perlStorageClass xxx links to perlType
perlSpecialAscii xxx links to perlSpecial
perlSpecialDollar xxx links to perlSpecial
perlSync       xxx cleared
perlSyncPOD    xxx cleared
vimPerlRegion  xxx cleared
rubyConditional xxx links to Conditional
rubyExceptional xxx links to rubyConditional
rubyMethodExceptional xxx links to rubyDefine
rubyTodo       xxx links to Todo
rubyStringEscape xxx links to Special
rubyQuoteEscape xxx links to rubyStringEscape
rubyInterpolationDelimiter xxx links to Delimiter
rubyInterpolation xxx cleared
rubyInstanceVariable xxx links to rubyIdentifier
rubyClassVariable xxx links to rubyIdentifier
rubyGlobalVariable xxx links to rubyIdentifier
rubyPredefinedVariable xxx links to rubyPredefinedIdentifier
rubyInvalidVariable xxx links to Error
rubyNoInterpolation xxx links to rubyString
rubyDelimiterEscape xxx cleared
rubyString     xxx links to String
rubyNestedParentheses xxx cleared
rubyNestedCurlyBraces xxx cleared
rubyNestedAngleBrackets xxx cleared
rubyNestedSquareBrackets xxx cleared
rubyRegexpSpecial xxx links to Special
rubyRegexpComment xxx links to Comment
rubyRegexpParens xxx cleared
rubyRegexpCharClass xxx links to rubyRegexpSpecial
rubyRegexpEscape xxx links to rubyRegexpSpecial
rubyRegexpBrackets xxx cleared
rubyRegexpQuantifier xxx links to rubyRegexpSpecial
rubyRegexpAnchor xxx links to rubyRegexpSpecial
rubyRegexpDot  xxx links to rubyRegexpCharClass
rubyASCIICode  xxx links to Character
rubyInteger    xxx links to Number
rubyFloat      xxx links to Float
rubyLocalVariableOrMethod xxx cleared
rubyBlockArgument xxx cleared
rubyConstant   xxx links to Type
rubySymbol     xxx links to Constant
rubyCapitalizedMethod xxx links to rubyLocalVariableOrMethod
rubyBlockParameter xxx links to rubyIdentifier
rubyBlockParameterList xxx cleared
rubyPredefinedConstant xxx links to rubyPredefinedIdentifier
rubyRegexpDelimiter xxx links to rubyStringDelimiter
rubyRegexp     xxx links to rubyString
rubyStringDelimiter xxx links to Delimiter
rubySymbolDelimiter xxx links to rubySymbol
rubyHeredocStart xxx cleared
rubyHeredoc    xxx links to rubyString
rubyAliasDeclaration2 xxx cleared
rubyAliasDeclaration xxx cleared
rubyBoolean    xxx links to Boolean
rubyPseudoVariable xxx links to Constant
rubyMethodDeclaration xxx cleared
rubyOperator   xxx links to Operator
rubyClassDeclaration xxx cleared
rubyModuleDeclaration xxx cleared
rubyFunction   xxx links to Function
rubyControl    xxx links to Statement
rubyKeyword    xxx links to Keyword
rubyBeginEnd   xxx links to Statement
rubyDefine     xxx links to Define
rubyClass      xxx links to rubyDefine
rubyModule     xxx links to rubyDefine
rubyMethodBlock xxx cleared
rubyBlock      xxx cleared
rubyConditionalModifier xxx links to rubyConditional
rubyRepeatModifier xxx links to rubyRepeat
rubyLineContinuation xxx cleared
rubyDoBlock    xxx cleared
rubyCurlyBlockDelimiter xxx cleared
rubyCurlyBlock xxx cleared
rubyArrayDelimiter xxx cleared
rubyArrayLiteral xxx cleared
rubyBlockExpression xxx cleared
rubyCaseExpression xxx cleared
rubyConditionalExpression xxx cleared
rubyRepeat     xxx links to Repeat
rubyOptionalDo xxx links to rubyRepeat
rubyOptionalDoLine xxx cleared
rubyRepeatExpression xxx cleared
rubyAccess     xxx links to Statement
rubyAttribute  xxx links to Statement
rubyEval       xxx links to Statement
rubyException  xxx links to Exception
rubyInclude    xxx links to Include
rubySharpBang  xxx links to PreProc
rubySpaceError xxx links to rubyError
rubyComment    xxx links to Comment
rubyMultilineComment xxx cleared
rubyDocumentation xxx links to Comment
rubyKeywordAsMethod xxx cleared
rubyDataDirective xxx links to Delimiter
rubyData       xxx links to Comment
rubyIdentifier xxx links to Identifier
rubyPredefinedIdentifier xxx links to rubyIdentifier
rubyError      xxx links to Error
vimRubyRegion  xxx cleared
pythonStatement xxx links to Statement
pythonFunction xxx links to Function
pythonConditional xxx links to Conditional
pythonRepeat   xxx links to Repeat
pythonInclude  xxx links to Include
pythonAsync    xxx links to Statement
pythonDecorator xxx links to Define
pythonDecoratorName xxx links to Function
pythonDoctestValue xxx links to Define
pythonMatrixMultiply xxx cleared
pythonTodo     xxx links to Todo
pythonComment  xxx links to Comment
pythonQuotes   xxx links to String
pythonEscape   xxx links to Special
pythonString   xxx links to String
pythonTripleQuotes xxx ctermfg=210 guifg=#ff8080
pythonSpaceError xxx cleared
pythonDoctest  xxx links to Special
pythonRawString xxx links to String
pythonNumber   xxx links to Number
pythonBuiltin  xxx links to Function
pythonAttribute xxx cleared
pythonExceptions xxx links to Structure
pythonSync     xxx cleared
vimPythonRegion xxx cleared
vimEmbedError  xxx links to vimError
vimAugroupSyncA xxx cleared
vimError       xxx links to Error
vimKeyCodeError xxx links to vimError
vimWarn        xxx links to WarningMsg
vimAuHighlight xxx links to vimHighlight
vimAutoCmdOpt  xxx links to vimOption
vimAutoSet     xxx links to vimCommand
vimCondHL      xxx links to vimCommand
vimElseif      xxx links to vimCondHL
vimFold        xxx links to Folded
vimSynOption   xxx links to Special
vimHLMod       xxx links to PreProc
vimKeyCode     xxx links to vimSpecFile
vimKeyword     xxx links to Statement
vimSpecial     xxx links to Type
vimStatement   xxx links to Statement
airline_x_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_x_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_x_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_y_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_y_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_y_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_z_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_z_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_z_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_error_inactive xxx ctermfg=232 ctermbg=160 guifg=#000000 guibg=#990000
airline_error_inactive_bold xxx term=bold cterm=bold ctermfg=232 ctermbg=160 gui=bold guifg=#000000 guibg=#990000
airline_error_inactive_red xxx ctermfg=160 ctermbg=160 guifg=#ff0000 guibg=#990000
airline_a_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_a_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_a_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_b_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_b_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_b_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_c_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_c_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_c_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_warning_inactive xxx ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00
airline_warning_inactive_bold xxx term=bold cterm=bold ctermfg=232 ctermbg=166 gui=bold guifg=#000000 guibg=#df5f00
airline_warning_inactive_red xxx ctermfg=160 ctermbg=166 guifg=#ff0000 guibg=#df5f00
airline_x      xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_x_bold xxx term=bold cterm=bold ctermfg=173 ctermbg=235 gui=bold guifg=#dc9656 guibg=#282828
airline_x_red  xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_y      xxx ctermfg=254 ctermbg=237 guifg=#e8e8e8 guibg=#383838
airline_y_bold xxx term=bold cterm=bold ctermfg=254 ctermbg=237 gui=bold guifg=#e8e8e8 guibg=#383838
airline_y_red  xxx ctermfg=160 ctermbg=237 guifg=#ff0000 guibg=#383838
airline_z      xxx ctermfg=235 ctermbg=143 guifg=#282828 guibg=#a1b56c
airline_z_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=143 gui=bold guifg=#282828 guibg=#a1b56c
airline_z_red  xxx ctermfg=160 ctermbg=143 guifg=#ff0000 guibg=#a1b56c
airline_error  xxx ctermfg=232 ctermbg=160 guifg=#000000 guibg=#990000
airline_error_bold xxx term=bold cterm=bold ctermfg=232 ctermbg=160 gui=bold guifg=#000000 guibg=#990000
airline_error_red xxx ctermfg=160 ctermbg=160 guifg=#ff0000 guibg=#990000
airline_a      xxx ctermfg=235 ctermbg=143 guifg=#282828 guibg=#a1b56c
airline_a_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=143 gui=bold guifg=#282828 guibg=#a1b56c
airline_a_red  xxx ctermfg=160 ctermbg=143 guifg=#ff0000 guibg=#a1b56c
airline_b      xxx ctermfg=254 ctermbg=237 guifg=#e8e8e8 guibg=#383838
airline_b_bold xxx term=bold cterm=bold ctermfg=254 ctermbg=237 gui=bold guifg=#e8e8e8 guibg=#383838
airline_b_red  xxx ctermfg=160 ctermbg=237 guifg=#ff0000 guibg=#383838
airline_c      xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_c_bold xxx term=bold cterm=bold ctermfg=173 ctermbg=235 gui=bold guifg=#dc9656 guibg=#282828
airline_c_red  xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_warning xxx ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00
airline_warning_bold xxx term=bold cterm=bold ctermfg=232 ctermbg=166 gui=bold guifg=#000000 guibg=#df5f00
airline_warning_red xxx ctermfg=160 ctermbg=166 guifg=#ff0000 guibg=#df5f00
CtrlPwhite     xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
CtrlPlight     xxx ctermfg=15 ctermbg=249 guifg=#f8f8f8 guibg=#b8b8b8
CtrlPdark      xxx ctermfg=15 ctermbg=237 guifg=#f8f8f8 guibg=#383838
CtrlParrow1    xxx ctermfg=249 ctermbg=235 guifg=#b8b8b8 guibg=#282828
CtrlParrow2    xxx ctermfg=235 ctermbg=249 guifg=#282828 guibg=#b8b8b8
CtrlParrow3    xxx ctermfg=249 ctermbg=237 guifg=#b8b8b8 guibg=#383838
airline_tab    xxx ctermfg=254 ctermbg=237 guifg=#e8e8e8 guibg=#383838
airline_tabsel xxx ctermfg=235 ctermbg=143 guifg=#282828 guibg=#a1b56c
airline_tabtype xxx ctermfg=235 ctermbg=139 guifg=#282828 guibg=#ba8baf
airline_tabfill xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_tabmod xxx ctermfg=235 ctermbg=109 guifg=#282828 guibg=#7cafc2
airline_tabmod_unsel xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_tabhid xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_tab_right xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_tabsel_right xxx ctermfg=235 ctermbg=143 guifg=#282828 guibg=#a1b56c
airline_tabmod_right xxx ctermfg=235 ctermbg=109 guifg=#282828 guibg=#7cafc2
airline_tabhid_right xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_tabmod_unsel_right xxx ctermfg=173 ctermbg=235 guifg=#dc9656 guibg=#282828
airline_a_to_airline_b xxx ctermfg=143 ctermbg=237
airline_b_to_airline_c xxx ctermfg=237 ctermbg=235
airline_c_to_airline_x xxx ctermfg=235 ctermbg=235
airline_x_to_airline_y xxx ctermfg=237 ctermbg=235
airline_y_to_airline_z xxx ctermfg=143 ctermbg=237
airline_z_to_airline_warning xxx ctermfg=166 ctermbg=143
airline_warning_to_airline_error xxx ctermfg=160 ctermbg=166
airline_c1_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
SyntasticErrorSign xxx links to Error
SyntasticWarningSign xxx links to Todo
SyntasticStyleErrorSign xxx links to SyntasticErrorSign
SyntasticStyleWarningSign xxx links to SyntasticWarningSign
SyntasticStyleErrorLine xxx links to SyntasticErrorLine
SyntasticErrorLine xxx cleared
SyntasticStyleWarningLine xxx links to SyntasticWarningLine
SyntasticWarningLine xxx cleared
airline_tabsel_to_airline_tabfill xxx ctermfg=143 ctermbg=235
airline_tabfill_to_airline_tabfill xxx ctermfg=235 ctermbg=235
airline_tabfill_to_airline_tabtype xxx ctermfg=139 ctermbg=235
airline_tabmod_to_airline_tabfill xxx ctermfg=109 ctermbg=235
airline_x_to_airline_y_bold xxx term=bold cterm=bold ctermfg=237 ctermbg=235 gui=bold
airline_x_to_airline_y_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_a_to_airline_b_bold xxx term=bold cterm=bold ctermfg=143 ctermbg=237 gui=bold
airline_a_to_airline_b_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
airline_b_to_airline_c_bold xxx term=bold cterm=bold ctermfg=237 ctermbg=235 gui=bold
airline_b_to_airline_c_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_c_to_airline_x_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_c_to_airline_x_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_z_to_airline_warning_bold xxx term=bold cterm=bold ctermfg=166 ctermbg=143 gui=bold
airline_z_to_airline_warning_red xxx ctermfg=160 ctermbg=143 guifg=#ff0000
airline_y_to_airline_z_bold xxx term=bold cterm=bold ctermfg=143 ctermbg=237 gui=bold
airline_y_to_airline_z_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
airline_warning_to_airline_error_bold xxx term=bold cterm=bold ctermfg=160 ctermbg=166 gui=bold
airline_warning_to_airline_error_red xxx ctermfg=160 ctermbg=166 guifg=#ff0000
airline_tabsel_to_airline_tabfill_bold xxx term=bold cterm=bold ctermfg=143 ctermbg=235 gui=bold
airline_tabsel_to_airline_tabfill_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabfill_to_airline_tabtype_bold xxx term=bold cterm=bold ctermfg=139 ctermbg=235 gui=bold
airline_tabfill_to_airline_tabtype_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabfill_to_airline_tabfill_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_tabfill_to_airline_tabfill_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabmod_to_airline_tabfill_bold xxx term=bold cterm=bold ctermfg=109 ctermbg=235 gui=bold
airline_tabmod_to_airline_tabfill_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
CtrlPMark      xxx links to Search
CtrlPMatch     xxx links to Identifier
CtrlPPrtText   xxx links to Normal
CtrlPBufferCur xxx links to Question
CtrlPNoEntries xxx links to Error
CtrlPBufferCurMod xxx links to WarningMsg
CtrlPBufferInd xxx links to Normal
CtrlPPrtBase   xxx links to Comment
CtrlPBufferHidMod xxx links to String
CtrlPMode1     xxx links to Character
CtrlPMode2     xxx links to LineNr
CtrlPBufferNr  xxx links to Constant
CtrlPBufferVis xxx links to Normal
CtrlPBufferVisMod xxx links to Identifier
CtrlPBufferPath xxx links to Comment
CtrlPPrtCursor xxx links to Constant
CtrlPStats     xxx links to Function
CtrlPBufferHid xxx links to Comment
CtrlPLinePre   xxx ctermfg=234 guifg=234
CtrlPlight_to_CtrlPwhite xxx ctermfg=249 ctermbg=235
CtrlPwhite_to_CtrlPlight xxx ctermfg=235 ctermbg=249
CtrlPlight_to_CtrlPdark xxx ctermfg=249 ctermbg=237
CtrlPdark_to_CtrlPdark xxx ctermfg=237 ctermbg=237
CtrlPdark_to_CtrlPlight xxx ctermfg=249 ctermbg=237
airline_tab_to_airline_tabfill xxx ctermfg=237 ctermbg=235
airline_c1_to_airline_x xxx ctermfg=235 ctermbg=234
airline_c1_inactive_bold xxx cleared
airline_c1_inactive_red xxx cleared
CtrlPlight_to_CtrlPdark_inactive xxx ctermfg=234 ctermbg=234
airline_tabsel_to_airline_tabfill_inactive xxx ctermfg=234 ctermbg=234
airline_tabfill_to_airline_tabfill_inactive xxx ctermfg=234 ctermbg=234
airline_tabmod_to_airline_tabfill_inactive xxx ctermfg=234 ctermbg=234
airline_c_to_airline_x_inactive xxx ctermfg=235 ctermbg=235
airline_c1_to_airline_x_inactive xxx ctermfg=235 ctermbg=235
CtrlPwhite_to_CtrlPlight_inactive xxx ctermfg=234 ctermbg=234
airline_warning_to_airline_error_inactive xxx ctermfg=160 ctermbg=166
airline_tab_to_airline_tabfill_inactive xxx ctermfg=234 ctermbg=234
airline_z_to_airline_warning_inactive xxx ctermfg=166 ctermbg=235
airline_a_to_airline_b_inactive xxx ctermfg=235 ctermbg=235
CtrlPdark_to_CtrlPdark_inactive xxx ctermfg=234 ctermbg=234
airline_b_to_airline_c_inactive xxx ctermfg=235 ctermbg=235
airline_x_to_airline_y_inactive xxx ctermfg=235 ctermbg=235
CtrlPdark_to_CtrlPlight_inactive xxx ctermfg=234 ctermbg=234
airline_tabfill_to_airline_tabtype_inactive xxx ctermfg=234 ctermbg=234
airline_y_to_airline_z_inactive xxx ctermfg=235 ctermbg=235
CtrlPlight_to_CtrlPwhite_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tabsel xxx ctermfg=235 ctermbg=143
airline_c3_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_tabhid_to_airline_tab xxx ctermfg=235 ctermbg=237
airline_c3_to_airline_x xxx ctermfg=235 ctermbg=234
airline_tabsel_to_airline_tabfill_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabsel_to_airline_tabfill_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabsel_to_airline_tabfill_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_c1_to_airline_x_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_c1_to_airline_x_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_c1_to_airline_x_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_warning_to_airline_error_inactive_inactive xxx ctermfg=160 ctermbg=166
airline_warning_to_airline_error_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=160 ctermbg=166 gui=bold
airline_warning_to_airline_error_inactive_inactive_red xxx ctermfg=160 ctermbg=166 guifg=#ff0000
airline_a_to_airline_b_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_a_to_airline_b_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_a_to_airline_b_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabmod_to_airline_tabfill_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabmod_to_airline_tabfill_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabmod_to_airline_tabfill_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_c_to_airline_x_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_c_to_airline_x_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_c_to_airline_x_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_z_to_airline_warning_inactive_inactive xxx ctermfg=166 ctermbg=235
airline_z_to_airline_warning_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=166 ctermbg=235 gui=bold
airline_z_to_airline_warning_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_x_to_airline_y_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_x_to_airline_y_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_x_to_airline_y_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
CtrlPlight_to_CtrlPwhite_inactive_inactive xxx ctermfg=234 ctermbg=234
CtrlPlight_to_CtrlPwhite_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
CtrlPlight_to_CtrlPwhite_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
CtrlPdark_to_CtrlPdark_inactive_inactive xxx ctermfg=234 ctermbg=234
CtrlPdark_to_CtrlPdark_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
CtrlPdark_to_CtrlPdark_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabfill_to_airline_tabtype_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabfill_to_airline_tabtype_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabfill_to_airline_tabtype_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabfill_to_airline_tabfill_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabfill_to_airline_tabfill_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabfill_to_airline_tabfill_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
CtrlPwhite_to_CtrlPlight_inactive_inactive xxx ctermfg=234 ctermbg=234
CtrlPwhite_to_CtrlPlight_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
CtrlPwhite_to_CtrlPlight_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
CtrlPdark_to_CtrlPlight_inactive_inactive xxx ctermfg=234 ctermbg=234
CtrlPdark_to_CtrlPlight_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
CtrlPdark_to_CtrlPlight_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_b_to_airline_c_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_b_to_airline_c_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_b_to_airline_c_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_y_to_airline_z_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_y_to_airline_z_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_y_to_airline_z_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tab_to_airline_tabfill_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tab_to_airline_tabfill_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tab_to_airline_tabfill_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
CtrlPlight_to_CtrlPdark_inactive_inactive xxx ctermfg=234 ctermbg=234
CtrlPlight_to_CtrlPdark_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
CtrlPlight_to_CtrlPdark_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_c3_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_c3_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_tabhid_to_airline_tab_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tabsel_inactive xxx ctermfg=234 ctermbg=234
airline_c3_to_airline_x_inactive xxx ctermfg=235 ctermbg=235
airline_tabhid_to_airline_tabsel_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=143 gui=bold
airline_tabhid_to_airline_tabsel_red xxx ctermfg=160 ctermbg=143 guifg=#ff0000
CtrlPlight_to_CtrlPdark_bold xxx term=bold cterm=bold ctermfg=249 ctermbg=237 gui=bold
CtrlPlight_to_CtrlPdark_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
airline_tab_to_airline_tabfill_bold xxx term=bold cterm=bold ctermfg=237 ctermbg=235 gui=bold
airline_tab_to_airline_tabfill_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
CtrlPlight_to_CtrlPwhite_bold xxx term=bold cterm=bold ctermfg=249 ctermbg=235 gui=bold
CtrlPlight_to_CtrlPwhite_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_c1_to_airline_x_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=234 gui=bold
airline_c1_to_airline_x_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
CtrlPdark_to_CtrlPlight_bold xxx term=bold cterm=bold ctermfg=249 ctermbg=237 gui=bold
CtrlPdark_to_CtrlPlight_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
CtrlPwhite_to_CtrlPlight_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=249 gui=bold
CtrlPwhite_to_CtrlPlight_red xxx ctermfg=160 ctermbg=249 guifg=#ff0000
CtrlPdark_to_CtrlPdark_bold xxx term=bold cterm=bold ctermfg=237 ctermbg=237 gui=bold
CtrlPdark_to_CtrlPdark_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
jediIgnore     xxx links to Ignore
jediFatSymbol  xxx links to Ignore
jediFat        xxx links to TabLine
jediSpace      xxx links to Normal
jediFunction   xxx links to CursorLine
airline_c4_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_tabhid_to_airline_tab_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=237 gui=bold
airline_tabhid_to_airline_tab_red xxx ctermfg=160 ctermbg=237 guifg=#ff0000
airline_c3_to_airline_x_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=234 gui=bold
airline_c3_to_airline_x_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabhid_to_airline_tabmod xxx ctermfg=235 ctermbg=109
airline_tabhid_to_airline_tabmod_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=109 gui=bold
airline_tabhid_to_airline_tabmod_red xxx ctermfg=160 ctermbg=109 guifg=#ff0000
airline_tabsel_to_airline_tabhid xxx ctermfg=143 ctermbg=235
airline_tabsel_to_airline_tabhid_bold xxx term=bold cterm=bold ctermfg=143 ctermbg=235 gui=bold
airline_tabsel_to_airline_tabhid_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabmod_to_airline_tabhid xxx ctermfg=109 ctermbg=235
airline_tabmod_to_airline_tabhid_bold xxx term=bold cterm=bold ctermfg=109 ctermbg=235 gui=bold
airline_tabmod_to_airline_tabhid_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabhid_to_airline_tabsel_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tabsel_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabhid_to_airline_tabsel_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_c3_to_airline_x_inactive_inactive xxx ctermfg=235 ctermbg=235
airline_c3_to_airline_x_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=235 gui=bold
airline_c3_to_airline_x_inactive_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_tabhid_to_airline_tab_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tab_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabhid_to_airline_tab_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabhid_to_airline_tabmod_inactive xxx ctermfg=234 ctermbg=234
airline_tabsel_to_airline_tabhid_inactive xxx ctermfg=234 ctermbg=234
airline_tabmod_to_airline_tabhid_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tabmod_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabhid_to_airline_tabmod_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabhid_to_airline_tabmod_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabmod_to_airline_tabhid_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabmod_to_airline_tabhid_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabmod_to_airline_tabhid_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tabsel_to_airline_tabhid_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tabsel_to_airline_tabhid_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tabsel_to_airline_tabhid_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_tab_to_airline_tabhid xxx ctermfg=237 ctermbg=235
airline_tab_to_airline_tabhid_inactive xxx ctermfg=234 ctermbg=234
airline_c5_inactive xxx ctermfg=253 ctermbg=235 guifg=#d8d8d8 guibg=#282828
airline_tab_to_airline_tabhid_bold xxx term=bold cterm=bold ctermfg=237 ctermbg=235 gui=bold
airline_tab_to_airline_tabhid_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000
airline_c4_to_airline_x xxx ctermfg=235 ctermbg=234
airline_tab_to_airline_tabhid_inactive_inactive xxx ctermfg=234 ctermbg=234
airline_tab_to_airline_tabhid_inactive_inactive_bold xxx term=bold cterm=bold ctermfg=234 ctermbg=234 gui=bold
airline_tab_to_airline_tabhid_inactive_inactive_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000
airline_c4_inactive_bold xxx term=bold cterm=bold ctermfg=253 ctermbg=235 gui=bold guifg=#d8d8d8 guibg=#282828
airline_c4_inactive_red xxx ctermfg=160 ctermbg=235 guifg=#ff0000 guibg=#282828
airline_c4_to_airline_x_inactive xxx ctermfg=235 ctermbg=235
airline_c4_to_airline_x_bold xxx term=bold cterm=bold ctermfg=235 ctermbg=234 gui=bold
airline_c4_to_airline_x_red xxx ctermfg=160 ctermbg=234 guifg=#ff0000

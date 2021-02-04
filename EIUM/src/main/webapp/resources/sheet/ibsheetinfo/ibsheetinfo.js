var gJson = {Data: [[]]};

/*
 * IBSheet를 생성(호출 위치에서 동적 생성)
 */
function createIBSheet(sheetid, width, height, locale) {
    var div_str = "";

    if (!locale) locale = "";

    Grids.Locale = locale;
    Grids.Config = _ibcfg;
    Grids.Msg = _ibmsg;
    Grids.MainCss = _ibcss;
    
    div_str += "<div id='DIV_" + sheetid + "' style='width:" + width + ";height:" + height + ";'>";
    div_str += "<script> IBSheet('<ibsheet Sync=\"1\" Data_Sync=\"0\"> </ibsheet>',\"DIV_" + sheetid + "\", \"" + sheetid + "\"); </script>"
    div_str += "</div>\n";

    //<![CDATA[
    document.write(div_str);
    //]]>
}

/*
 * IBSheet를 생성 (특정 div 하위로 넣는 경우에 사용)
 */
function createIBSheet2(obj, sheetid, width, height, locale) {
    // locale 처리
    Grids.Locale = locale ? locale : "";

    // width, height 적용
    obj.style.width = width;
    obj.style.height = height;

    IBSheet('<ibsheet Sync=\"1\" Data_Sync=\"0\"> </ibsheet>', obj.id, sheetid);
   
}

/* MergeSheet 속성에 설정 값 */
var msNone            = 0, // 머지 없음
    msAll             = 1, // 전부 머지 가능
    msPrevColumnMerge = 2, // 앞 컬럼이 머지 된 경우 해당 행 안에서 머지 가능
    msFixedMerge      = 3, // 단위데이터행 구조에서의 고정 셀 병합 기능
    msBaseColumnMerge = 4, // 기준 컬럼 머지 영역 범위 내에서의 머지 기능
    msHeaderOnly      = 5; // 해더만 머지

/* BasicImeMode 속성 설정 값 */
var imeAuto = 0; // 마지막 상태를 그대로 사용
var imeHan  = 1; // 기본 상태를 한글 입력 상태로 함
var imeEng  = 2; // 기본 상태를 영문 입력 상태로 함

/* SizeMode 속성 설정 값 */
var sizeAuto         = 0; // 설정한 높이, 너비 그대로 사용
var sizeNoVScroll    = 1; // 높이를 스크롤 없이 자동 설정
var sizeNoHScroll    = 2; // 너비를 스크롤 없이 자동 설정
var sizeNoBothScroll = 3; // 높이, 너비 모두 스크롤 없이 자동 설정

/* SearchMode 속성 설정 값 */
var smGeneral       = 0, // 일반 조회
    smClientPaging  = 1, // 클라이언트 페이징 조회
    smLazyLoad      = 2, // Lazy Load 조회
    smServerPaging  = 3, // 실시간 서버 페이징 조회 (Scroll 방식)
    smServerPaging2 = 4; // 실시간 서버 페이징 조회 (Page Index 방식)

/* SumPosition 속성 설정 값 */
var posTop    = 0; // 상단 고정 위치
var posBottom = 1; // 하단 고정 위치

/* VScrollMode 속성 설정 값 */
var vsAuto   = 0; // 자동 생성
var vsFixed = 1; // 고정 생성

/*
    FormQueryString 관련 함수 정의
*/
/* FormQueryString과 FormQueryStringEnc함수에서 필수입력 체크시 메시지로 사용한다.-3.4.0.50 */
var IBS_MSG_REQUIRED = "은(는) 필수입력 항목입니다.";

/**
 * 에러메시지를 표시한다. IBS_ShowErrMsg 대신 이 함수를 사용해야 한다.
 * @param   : sMsg      - 메시지
 * @return  : 없음
 * @version : 3.4.0.50
 * @sample
 *  IBS_ShowErrMsg("에러가 발생했습니다.");
 */
function IBS_ShowErrMsg(sMsg) {
    return alert("[IBSheetInfo.js]\n" + sMsg);
}

function IBS_getName(obj) {
    if (obj.name != "") {
        return obj.name;
    } else if (obj.id != "") {
        return obj.id;
    } else {
        return "";
    }
}

function IBS_RequiredChk(obj) {
    return (obj.getAttribute("required") != null);
}

/**
 * Form오브젝트 안에 있는 컨트롤을 QueryString으로 구성한다. 이때, 한글은 인코딩하지 않는다.
 * @param   : form          - 필수,html의 Form 오브젝트 Name
 * @param   : checkRequired - 선택,필수입력 체크 여부(true,false)
 * @return  : String        - Form오브젝트 안에 Control을 QueryString으로 구성한 문자열
 *            undefined     - checkRequired인자가 true이고, 필수입력에 걸린경우 return 값
 * @version : 1.0.0.0,
 *            3.4.0.50(checkRequired 인자 추가)
 * @sample1
 *  var sCondParam=FormQueryString(document.frmSearch); //결과:"txtname=이경희&rdoYn=1&sltMoney=원화";
 * @sample2
 *  <input type="text" name="txtName" required="이름">        //필수 입력 항목이면 required="이름" 를 설정한다.
 *  var sCondParam = FormQueryString(document.mainForm, true);//필수입력까지 체크하며, 필수입력에 걸리면 리턴값은 null
 *  if (sCondParam==null) return;
 */
function FormQueryString(form, checkRequired) {
    if (typeof form != "object" || form.tagName != "FORM") {
        IBS_ShowErrMsg("FormQueryString 함수의 인자는 FORM 태그가 아닙니다.");
        return "";
    }

    if (checkRequired == null) checkRequired = false;

    var name = new Array(form.elements.length);
    var value = new Array(form.elements.length);
    var j = 0;
    var plain_text = "";

    //사용가능한 컨트롤을 배열로 생성한다.
    len = form.elements.length;
    for (i = 0; i < len; i++) {
        var prev_j = j;
        switch (form.elements[i].type) {
            case undefined:
            case "button":
            case "reset":
            case "submit":
                break;
            case "radio":
            case "checkbox":
                if (form.elements[i].checked == true) {
                    name[j] = IBS_getName(form.elements[i]);
                    value[j] = form.elements[i].value;
                    j++;
                }
                break;
            case "select-one":
                name[j] = IBS_getName(form.elements[i]);
                var ind = form.elements[i].selectedIndex;
                if (ind >= 0) {

                    value[j] = form.elements[i].options[ind].value;

                } else {
                    value[j] = "";
                }
                j++;
                break;
            case "select-multiple":
                name[j] = IBS_getName(form.elements[i]);
                var llen = form.elements[i].length;
                var increased = 0;
                for (k = 0; k < llen; k++) {
                    if (form.elements[i].options[k].selected) {
                        name[j] = IBS_getName(form.elements[i]);
                        value[j] = form.elements[i].options[k].value;

                        j++;
                        increased++;
                    }
                }
                if (increased > 0) {
                    j--;
                } else {
                    value[j] = "";
                }
                j++;
                break;
            default:
                name[j] = IBS_getName(form.elements[i]);
                value[j] = form.elements[i].value;
                j++;
        }

        if (checkRequired) {
            //html 컨트롤 태그에 required속성을 설정하면 필수입력을 확인할 수 있다.
            //<input type="text" name="txtName" required="이름">

            if (IBS_RequiredChk(form.elements[i]) && prev_j != j && value[prev_j] == "") {

                if (form.elements[i].getAttribute("required") == null ||
                    form.elements[i].getAttribute("required") == ""
                ) {
                    alert('"' + IBS_getName(form.elements[i]) + '"' + IBS_MSG_REQUIRED);
                } else {

                    alert('"' + form.elements[i].getAttribute("required") + '"' + IBS_MSG_REQUIRED);
                }
                //컨트롤이 숨겨져 있을수도 있으므로 에러 감싼다.
                try {
                    form.elements[i].focus();
                } catch (ee) {;
                }

                return;
            }
        }
    }
    //QueryString을 조합한다.
    for (i = 0; i < j; i++) {
        if (name[i] != '') plain_text += name[i] + "=" + value[i] + "&";
    }

    //마지막에 &를 없애기 위함
    if (plain_text != "") plain_text = plain_text.substr(0, plain_text.length - 1);

    return plain_text;
}

/**
 * Form오브젝트 안에 있는 컨트롤을 QueryString으로 구성한다. 이때, 한글은 인코딩한다.
 * @param   : form          - 필수,html의 Form 오브젝트 Name
 * @param   : Sheet         - 필수,IBheet의 Object id
 * @param   : checkRequired - 선택,필수입력 체크 여부(true,false)
 * @return  : String        - Form오브젝트 안에 Control을 QueryString으로 구성한 문자열
 *            undefined     - checkRequired인자가 true이고, 필수입력에 걸린경우 return 값
 * @version : 1.0.0.0,
 *            3.4.0.50(checkRequired 인자 추가)
 * @sample1
 *  var sCondParam=FormQueryStringEnc(document.frmSearch, mySheet1);
 *  원본:"txtname=이경희&rdoYn=1&sltMoney=원화";
 *  결과:"txtname=%C0%CC%B0%E6%C8%F1&rdoYn=1&sltMoney=%BF%F8%C8%AD";                //UTF16인 경우
 *  결과:"txtname=%EC%9D%B4%EA%B2%BD%ED%9D%AC&rdoYn=1&sltMoney=%EC%9B%90%ED%99%94"; //UTF8인 경우
 * @sample2
 *  <input type="text" name="txtName" required="이름">                    //필수 입력 항목이면 required="이름" 를 설정한다.
 *  var sCondParam = FormQueryStringEnc(document.mainForm, mySheet, true);//필수입력까지 체크하며, 필수입력에 걸리면 리턴값은 null
 *  if (sCondParam==null) return;
 */
function FormQueryStringEnc(form, checkRequired) {
    if (typeof form != "object" || form.tagName != "FORM") {
        IBS_ShowErrMsg("FormQueryStringEnc 함수의 form 인자는 FORM 태그가 아닙니다.");
        return "";
    }


    if (checkRequired == null) checkRequired = false;

    var name = new Array(form.elements.length);
    var value = new Array(form.elements.length);
    var j = 0;
    var plain_text = "";

    //사용가능한 컨트롤을 배열로 생성한다.
    len = form.elements.length;
    for (i = 0; i < len; i++) {
        var prev_j = j;
        switch (form.elements[i].type) {
            case "button":
            case "reset":
            case "submit":
                break;
            case "radio":
            case "checkbox":
                if (form.elements[i].checked == true) {
                    name[j] = IBS_getName(form.elements[i]);
                    value[j] = form.elements[i].value;
                    j++;
                }
                break;
            case "select-one":
                name[j] = IBS_getName(form.elements[i]);
                var ind = form.elements[i].selectedIndex;
                if (ind >= 0) {

                    value[j] = form.elements[i].options[ind].value;

                } else {
                    value[j] = "";
                }
                j++;
                break;
            case "select-multiple":
                name[j] = IBS_getName(form.elements[i]);
                var llen = form.elements[i].length;
                var increased = 0;
                for (k = 0; k < llen; k++) {
                    if (form.elements[i].options[k].selected) {
                        name[j] = IBS_getName(form.elements[i]);

                        value[j] = form.elements[i].options[k].value;

                        j++;
                        increased++;
                    }
                }
                if (increased > 0) {
                    j--;
                } else {
                    value[j] = "";
                }
                j++;
                break;
            default:

                name[j] = IBS_getName(form.elements[i]);
                value[j] = form.elements[i].value;
                j++;
        }

        if (checkRequired) {
            //html 컨트롤 태그에 required속성을 설정하면 필수입력을 확인할 수 있다.
            //<input type="text" name="txtName" required="이름">
            if (IBS_RequiredChk(form.elements[i]) && prev_j != j && value[prev_j] == "") {
                if (form.elements[i].getAttribute("required") == "") {
                    alert('"' + IBS_getName(form.elements[i]) + '"' + IBS_MSG_REQUIRED);
                } else {
                    alert('"' + form.elements[i].getAttribute("required") + '"' + IBS_MSG_REQUIRED);
                }
                //컨트롤이 숨겨져 있을수도 있으므로 에러 감싼다.
                try {
                    form.elements[i].focus();
                } catch (ee) {;
                }

                return;
            }
        }
    }

    //QueryString을 조합한다.
    for (i = 0; i < j; i++) {
        if (name[i] != '') plain_text += encodeURIComponent(name[i]) + "=" + encodeURIComponent(value[i]) + "&";
    }

    //마지막에 &를 없애기 위함
    if (plain_text != "") plain_text = plain_text.substr(0, plain_text.length - 1);

    return plain_text;
}

/*------------------------------------------------------------------------------
 * titile : IBSheet의 조회,저장시 사용되는 함수
 * paramList : 
 * param1 : s_SAVENAME 객체를 담고 있는 form 객체
 * param2 : 조회해야 할 시트 객체
 * param3.. : 여러개 시트를 한번에 조회하는 경우 시트의 개수만큼 붙인다.
-------------------------------------------------------------------------------*/
function IBS_SaveName() {
    var param = arguments;
    if (param.length < 2) {
        IBS_ShowErrMsg("최하 두개의 인자가 필요합니다.");
        return;
    }

    if (param.length == 2) {
        param[0].s_SAVENAME.value = IBS_ConcatSaveName(param[1]);
    } else {
        param[0].s_SAVENAME.value = "";
        for (var i = 1; i < param.length; i++) {
            param[0].s_SAVENAME.value += IBS_ConcatSaveName(param[i]) + "@@";
        }
        var tempStr = param[0].s_SAVENAME.value;
        param[0].s_SAVENAME.value = tempStr.substring(0, tempStr.length - 2);
    }
}

function IBS_ConcatSaveName(sheet) {
    var lr  = sheet.GetDataRows(),
        lc  = sheet.LastCol(),
        res = [],
        r   = 0,
        c   = 0,
        cn  = "",
        sn  = "";

    for (r = 0; r < lr; r++) {
        for (c = 0; c <= lc; c++) {
            cn = sheet.GetColName(c);
            sn = sheet.ColSaveName(r, c);

            if (cn !== sn) {
                res.push(sn);
            }
        }
    }
    
    return res.join("|");
}

/*------------------------------------------------------------------------------
 * method : GetSaveJson
 * desc : 지정한 상태에 대한 데이터를 json 형태로 반환한다.
 * param list
 * param1 : IBSheet Object
 * param2 : 상태 (I|U|D)
 * param3 : SkipCol list 
-------------------------------------------------------------------------------*/
function GetSaveJson2(sheet, status, skipcols) {
    if (sheet == null) {
        alert("GetSaveJson2 함수의 첫번째 인자는 ibsheet 객체여야 합니다.");
        return;
    }

    var skipcolsArr = null;
    if (skipcols != null) {
        skipcolsArr = skipcols.split("|");
    }

    var rtnJson = {};
    if (status == null) {
        var temp = GetJsonStatus(sheet, "I", skipcolsArr);
        if (temp) rtnJson["INSERT"] = temp;
        temp = GetJsonStatus(sheet, "D", skipcolsArr);
        if (temp) rtnJson["DELETE"] = temp;
        temp = GetJsonStatus(sheet, "U", skipcolsArr);
        if (temp) rtnJson["UPDATE"] = temp;
    } else {
        switch (status) {
            case "I":
                rtnJson["INSERT"] = GetJsonStatus(sheet, "I", skipcolsArr);
                break;
            case "U":
                rtnJson["UPDATE"] = GetJsonStatus(sheet, "U", skipcolsArr);
                break;
            case "D":
                rtnJson["DELETE"] = GetJsonStatus(sheet, "D", skipcolsArr);
                break;
        }
        GetJsonStatus(sheet, status)
    }
    return rtnJson;
}

function GetJsonStatus(sheet, status, skipcolsArr) {
    var rtnJson = new Array();
    //지정한 상태 값을 갖는 행을 뽑는다.
    var rows = sheet.FindStatusRow(status);

    if (rows == "") return null;

    var rowArr = rows.split(";");

    for (var i = 0; i < rowArr.length; i++) {
        var temp = sheet.GetRowJson(rowArr[i]);
        if (skipcolsArr != null) {
            for (var c = 0; c < skipcolsArr.length; c++) {
                delete temp[skipcolsArr[c]];
            }
        }
        rtnJson.push(temp);
    }
    return rtnJson;
}




/**
    IBSheet 초기화 작업을 일괄 처리 한다.
    @method     IBS_InitSheet
    @public
    @param      {object}    sheet               대상 시트 객체
    @param      {object}    info                초기화 정보
    @param      {object}    info.Cols           컬럼 초기화 정보 객체
    @param      {object}    [info.Cfg]          시트 초기화 정보 객체
    @param      {object}    [info.Headers]      헤더 초기화 정보 객체
    @param      {object}    [info.HeaderMode]   헤더 모드 정보 객체
*/
function IBS_InitSheet(sheet, info) {

	
    var cInfo         = {},
        colsHeader    = [],
        useColsHeader = 0,
        max           = 0,
        cnt           = 0,
        dataRows      = 1;

    function appendHeaderText(last, col, header) {
        var unitHeader = header.split("|"),
            i          = 0,
            len        = 0;

        useColsHeader = 1;
        len = unitHeader.length;

        if (cnt < len) {
            cnt = len;
        }

        for (i = 0; i < len; i++) {
            if (typeof colsHeader[last + i] === "undefined") {
                colsHeader[last + i] = [];
            }

            colsHeader[last + i][col] = unitHeader[i];
        }
    };

    // 필수 입력 요소 체크
    if (!sheet || !info || !info.Cols) {
        alert("시트 초기화 정보가 올바르지 않습니다.");
        return;
    }

    cInfo = CloneArray(info);

    // DataRows 설정
    if (cInfo.Cols[0] && typeof cInfo.Cols[0].length !== "undefined") {
        dataRows = cInfo.Cols.length;
    }

    // Cfg 기본값 설정
    if (!cInfo.Cfg) {
        cInfo.Cfg = {};
    }

    // Headers 기본값 설정
    if (!cInfo.Headers) {
        cInfo.Headers = [{
            Text: "",
            Align: "Center"
        }];
    }

    // HeaderMode 기본값 설정 및 Align 처리
    if (!cInfo.HeaderMode) {
        cInfo.HeaderMode = {};
    } else {
        if (cInfo.HeaderMode.Align) {
            var header = cInfo.Headers;
            for (var i = 0, len = header.length; i < len; i++) {
                header[i].Align = cInfo.HeaderMode.Align;
            }
        }
    }

    for (var i = 0, len = cInfo.Cols.length; i < len; i++) {
        var col = cInfo.Cols[i];

        if (typeof col.Header === "undefined") {
            for (var j = 0, len2 = col.length; j < len2; j++) {
                var col2 = col[j];

                if (typeof col2.Header !== "undefined") {
                    appendHeaderText(max, j, col2.Header);
                    delete col2.Header;
                }
            }

            max += cnt;
            cnt = 0;
        } else {
            appendHeaderText(0, i, col.Header);
            delete col.Header;
        }
    }

    if (useColsHeader) {
        cInfo.Headers = [];
        for (var i = 0, len = colsHeader.length; i < len; i++) {
            var header = {};

            if (typeof colsHeader[i] === "undefined") {
                header.Text = "";
            } else {
                header.Text = colsHeader[i].join("|");
            }

            header.Align = cInfo.HeaderMode.Align || "Center";
            cInfo.Headers.push(header);
        }
    }

    sheet.SetConfig(cInfo.Cfg);
    sheet.InitHeaders(cInfo.Headers, cInfo.HeaderMode);
    
    for(var i=0;i<cInfo.Cols.length;i++){
    		if(cInfo.Cols[i].Type=="AutoSum"){
    			cInfo.Cols[i]["BackColor"] = "#FF0000";
    		}
    	}
    
    
    sheet.InitColumns(cInfo.Cols, dataRows);
}

/*------------------------------------------------------------------------------
* method : IBS_CopyJson2Form
* desc : json 데이터를 이름을 기준으로 폼객체에 넣는다.
* param list
* param1 : json 객체
* param2 : 대상 폼 name

json 자료 구조 :
{"폼객체명":{"객체명":"값","객체명2":"값2"}}
ex){"aFrm":{"sa_no":"12345","sa_name":"손이창","grade":"a3","married":"NO","enter_date":"2012-12-31"}}
-------------------------------------------------------------------------------*/
function IBS_CopyJson2Form(jsonobj, frmName) {
    var json,
        obj,
        stype,
        idx,
        max;

    if (typeof frmName == "object") {
        frmName = frmName.name;
    }

    json = jsonobj[frmName];

    for (j in json) {
        obj = null;

        try {
            obj = document[frmName][j];
            if (obj == null || typeof obj == "undefined") {
                obj = document.getElementById(j);
            }
            if (obj == null || typeof obj == "undefined") {
                continue;
            }
        } catch (e) {
            //alert(e.message);
        }

        stype = (obj.type);

        if (typeof stype == "undefined" && obj.length > 0) {
            stype = obj[0].type;
        }

        switch (stype) {
            case undefined:
            case "button":
            case "reset":
            case "submit":
                break;
            case "select-one":
                obj.value = json[j];
                break;
            case "radio":
                obj.checked = json[j];
                break;
            case "checkbox":
                obj.checked = json[j];
                break;
            default:
                obj.value = json[j];
                break;
        } //end of switch
    }
}

/*------------------------------------------------------------------------------
method : IBS_CopyForm2Sheet()
desc  : Form객체에 있는 내용을 시트에 복사
param list
param : json 유형

param 내부 설정값
sheet : 값을 입력 받을 ibsheet 객체 (필수)
form : copy할 폼객체 (필수)
row : ibsheet 객체의 행 (default : 현재 선택된 행)
sheetPreFiex : 맵핑할 시트의 SavaName 앞에 PreFix 문자 (default : "")
formPreFiex : 맵핑할 폼객체의 이름 혹은 id 앞에  PreFix 문자 (default : "")
useOnChange : 시트값 변경시 OnChange 이벤트 사용 유무 (default : false)
-------------------------------------------------------------------------------*/
function IBS_CopyForm2Sheet(param) {
    var sheetobj,
        formobj,
        row,
        sheetPreFix,
        frmPreFix,
        uoc,
        col,
        max,
        colSaveName,
        baseSaveName,
        frmchild,
        sType,
        sValue;

    if ((!param.sheet) || (!param.sheet.IBSheetVersion)) {
        IBS_ShowErrMsg("IBS_CopyForm2Sheet 함수의 sheet 인자가 없거나 ibsheet객체가 아닙니다.");
        return false;
    }
    if (param.form == null || typeof param.form != "object" || param.form.tagName != "FORM") {
        IBS_ShowErrMsg("IBS_CopyForm2Sheet 함수의 form 인자가 없거나 FORM 객체가 아닙니다.");
        return false;
    }

    sheetobj = param.sheet;
    formobj = param.form;
    row = param.row == null ? sheetobj.GetSelectRow() : param.row;
    sheetPreFix = param.sheetPreFix == null ? "" : param.sheetPreFix;
    frmPreFix = param.formPreFix == null ? "" : param.formPreFix;
    uoc = param.useOnChange == null ? 0 : param.useOnChange;
    if (row < 0) {
        alert("선택된 행이 존재하지 않습니다.");
        return;
    }

    //Sheet의 컬럼개수만큼 찾아서 HTML의 Form 각 Control에 값을 설정한다.
    //컬럼개수만큼 루프 실행
    for (col = 0, max = sheetobj.LastCol(); col <= max; col++) {
        //컬럼의 별명을 문자열로 가져온다.
        colSaveName = sheetobj.ColSaveName(col)
        if (colSaveName == "") {
            continue;
        }
        //PreFix가 붙지 않은 형태의 SaveName을 가져온다.
        baseSaveName = colSaveName.substring(sheetPreFix.length);

        frmchild = null;
        try {
            //폼에 있는 해당 이름의 컨트롤을 가져온다.예)"frm_CardNo"
            frmchild = formobj[frmPreFix + baseSaveName];
        } catch (e) {
            alert(e);
        }

        //폼에 해당하는 이름의 컨트롤이 없는 경우는 계속 진행한다.
        if (frmchild == null) continue;

        sType = frmchild.type;
        sValue = "";

        //radio의 경우 frmchild가 배열형태가 되므로, frmchild.type으로는 타입을 알수 없다.
        if (typeof sType == "undefined" && frmchild.length > 0) {
            sType = frmchild[0].type;
        }

        //타입별로 값을 설정한다.
        switch (sType) {
            case undefined:
            case "button":
            case "reset":
            case "submit":
                break;
            case "radio":
                for (idx = 0; idx < frmchild.length; idx++) {
                    if (frmchild[idx].checked) {
                        sValue = frmchild[idx].value;
                        break;
                    }
                }
                break;
            case "checkbox":
                sValue = (frmchild.checked) ? 1 : 0;
                break;
            default:
                sValue = frmchild.value;
        } //end of switch

        sheetobj.SetCellValue(row, sheetPreFix + baseSaveName, sValue, uoc);
    } //end of for(col)

    //정상적인 처리완료
    return true;
}

/*----------------------------------------------------------------------------
method : IBS_CopySheet2Form()
desc : 시트의 한 행을 폼객체에 복사

param list
param : json 유형

param 내부 설정값
sheet : 값을 입력 받을 ibsheet 객체 (필수)
form : copy할 폼객체 (필수)
row : ibsheet 객체의 행 (default : 현재 선택된 행)
sheetPreFiex : 맵핑할 시트의 SavaName 앞에 PreFix 문자 (default : "")
formPreFiex : 맵핑할 폼객체의 이름 혹은 id 앞에  PreFix 문자 (default : "")
-----------------------------------------------------------------------------*/
function IBS_CopySheet2Form(param) {
    var sheetobj,
        formobj,
        row,
        sheetPreFix,
        frmPreFix,
        col,
        max,
        colSaveName,
        baseSaveName,
        sheetvalue,
        frmchild,
        sType,
        sValue;

    if ((!param.sheet) || (!param.sheet.IBSheetVersion)) {
        IBS_ShowErrMsg("IBS_CopyForm2Sheet 함수의 sheet 인자가 없거나 ibsheet객체가 아닙니다.");
        return false;
    }

    if (param.form == null || typeof param.form != "object" || param.form.tagName != "FORM") {
        IBS_ShowErrMsg("IBS_CopyForm2Sheet 함수의 form 인자가 없거나 FORM 객체가 아닙니다.");
        return false;
    }
    sheetobj = param.sheet;
    formobj = param.form;
    row = param.row == null ? sheetobj.GetSelectRow() : param.row;
    sheetPreFix = param.sheetPreFix == null ? "" : param.sheetPreFix;
    frmPreFix = param.formPreFix == null ? "" : param.formPreFix;

    if (row < 0) {
        alert("선택된 행이 존재하지 않습니다.");
        return;
    }

    //Sheet의 컬럼개수만큼 찾아서 HTML의 Form 각 Control에 값을 설정한다.
    //컬럼개수만큼 루프 실행
    for (col = 0, max = sheetobj.LastCol(); col <= max; col++) {
        //컬럼의 별명을 문자열로 가져온다.
        colSaveName = sheetobj.ColSaveName(col)
        if (colSaveName == "") {
            continue;
        }
        //PreFix가 붙지 않은 형태의 SaveName을 가져온다.
        baseSaveName = colSaveName.substring(sheetPreFix.length);

        sheetvalue = sheetobj.GetCellText(row, sheetPreFix + baseSaveName);

        frmchild = null;
        try {
            //폼에 있는 해당 이름의 컨트롤을 가져온다.예)"frm_CardNo"
            frmchild = formobj[frmPreFix + baseSaveName];
        } catch (e) {

        }

        //폼에 해당하는 이름의 컨트롤이 없는 경우는 계속 진행한다.
        if (frmchild == null) {
            continue;
        }

        sType = frmchild.type;
        sValue = "";
        //radio의 경우 frmchild가 배열형태가 되므로, frmchild.type으로는 타입을 알수 없다.
        if (typeof sType == "undefined" && frmchild.length > 0) {
            sType = frmchild[0].type;
        }

        //타입별로 값을 설정한다.
        switch (sType) {
            case undefined:
            case "button":
            case "reset":
            case "submit":
                break;
            case "select-one":
                frmchild.value = sheetobj.GetCellValue(row, sheetPreFix + baseSaveName);
                break;
            case "radio":
                for (idx = 0, max = frmchild.length; idx < max; idx++) {
                    if (frmchild[idx].value == sheetvalue) {
                        frmchild[idx].checked = true;
                        break;
                    }
                }
                break;
            case "checkbox":
                frmchild.checked = (sheetobj.GetCellValue(row, sheetPreFix + baseSaveName) == 1);
                break;
            default:
                frmchild.value = sheetvalue;
                break;
        } //end of switch
    } //end of for(col)

    //정상적인 처리완료
    return true;
}


var _ibmsg = {
    "Lang": {
        "Alert": {
            "SYS_CanReloadStart": "",
            "SYS_CanReloadChanges": "모든 변경사항을 서버에 반영합니다.",
            "SYS_CanCancelChanges": "모든 변경사항을 취소합니다.",
            "SYS_And": "and",
            "SYS_CanReloadSelect": "모든 선택을 지웁니다.",
            "SYS_CanReloadEnd": "! 계속 하시겠습니까?",
            "SYS_ErrTimeout": "데이터를 다운로드 할 수 없습니다. 시간이 초과되었습니다.",
            "SYS_AskTimeout": "서버 시간초과로 데이터를 다운로드 할 수 없습니다. 재요청을 하시겠습니까?",
            "SYS_UploadTimeout": "데이터를 업로드 할 수 없습니다. 시간이 초과되었습니다.",
            "SYS_AskUploadTimeout": "서버 시간초과로 데이터를 업로드 할 수 없습니다. 재전송을 하시겠습니까?",
            "SYS_ErrHide": "컬럼을 숨김 처리 할 수 없습니다!",
            "SYS_ErrHideExt": "고정컬럼의 너비가 너무 큽니다!",
            "SYS_ErrPrintOpen": "인쇄 다이얼로그를 열 수 없습니다.",
            "SYS_ErrPrint": "문서 인쇄를 실패 하였습니다.",
            "SYS_ErrCheck": "서버 동기화에 실패하였습니다. 업데이트를 임시적으로 제한하시겠습니까?",
            "SYS_NotFound": "더 이상 찾을 항목이 없습니다.",
            "SYS_SearchStart": "검색 결과가 없습니다. 처음부터 다시 찾으시겠습니까?",
            "SYS_SearchError": "검색어 입력이 잘못되었습니다 !",
            "SYS_ErrAdd": "여기에 새로운 행을 추가 할 수 없습니다.",
            "SYS_Invalid": "잘못된 값",
            "SYS_DelRow": "%d' 행을 삭제 하시겠습니까 ?",
            "SYS_DelSelected": "%d 개의 선택된 행을 삭제 하시겠습니까 ?",
            "SYS_StyleErr": "IBSheet CSS 스타일을 로드 할 수 없습니다 !",
            "SYS_ExportDownload": "다운로드",
            "SYS_FoundResults": "%d 개를 찾았습니다.",
            "SYS_PrintPrepared": "출력할 준비가 되었습니다.",
            "SYS_InitColsError": "이미 컬럼초기화가 되어있습니다. 컬럼초기화를 취소합니다.",
            "SYS_FrozenColsError": "고정컬럼의 크기가 전체 컬럼 수 보다 같거나 큽니다.",
            "SYS_NoWordColumn": "선택된 컬럼에서 데이터를 찾지 못했습니다.",
            "SYS_NoWordAll": "시트 전체에서 데이터를 찾지 못했습니다.",
            "SYS_InitDataRowsError": "DataRows 설정이 잘못되었습니다.",
            "SYS_InvalidExcelFileExtension": "허용되지 않는 파일 형식입니다. 진행을 취소합니다.",
            "SYS_InvalidTextFileExtension": "허용되지 않는 파일 형식입니다. 진행을 취소합니다.",
            "SYS_ExceedClipCopyRange": "클립보드에 복사할 수 있는 데이터 범위를 초과하였습니다.",
            "SYS_InvalidComboList": "콤보목록 설정이 올바르지 않습니다.( %s )",
            "SYS_LoadExcelError": "엑셀 파일을 읽는 도중 예외가 발생하였습니다",
            "SYS_PivotPopupInvalidCols": "피벗 테이블 컬럼 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidRows": "피벗 테이블 행 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidValues": "피벗 테이블 값 레이블 설정이 잘못 되었습니다.",
            "SYS_PivotPopupInvalidData": "피벗 테이블 설정 대상 시트에 데이터가 없습니다."
        },
        "Text": {
            "SYS_InvalidChildNodeInsert": "부모 상태가 삭제이므로 자식레벨로 입력할 수 없습니다.",
            "SYS_InvalidChildNodeCopy": "부모 상태가 삭제이므로 자식레벨은 복사할 수 없습니다.",
            "SYS_ParentDelNotDelete": "부모행이 삭제상태여서 삭제 취소 할 수 없습니다.",
            "SYS_NotDelParent": "자식 행이 있으면 삭제가 불가능합니다.",
            "SYS_NoUpRow": "수정 상태의 행이 없습니다.",
            "SYS_NoInsRow": "입력 상태의 행이 없습니다.",
            "SYS_NoDelRow": "삭제 상태의 행이 없습니다.",
            "SYS_NoCopyArgument": "복사할 행이 없습니다.",
            "SYS_NoMoveArgument": "이동할 행이 없습니다.",
            "SYS_NoSumRow": "합계행이 없습니다.",
            "SYS_DelSelected": "선택한 행을 지웁니다.",
            "SYS_NoArgument": "인자가 없습니다.",
            "SYS_IncorrectArg": "인자값이 잘못되었습니다.",
            "SYS_IncorrectRow": "삭제할 행이 데이터 범위가 아닙니다.",
            "SYS_ConfirmDelete": "삭제하시겠습니까?",
            "SYS_NoDeleteData": "삭제할 행이 선택되지 않았습니다.",
            "SYS_ExtentErr": "그리드 공간이 부족합니다.",
            "SYS_Sort": "소팅처리중..",
            "SYS_SelectAll": "전체 선택중..",
            "SYS_DoFilter": "필터링중..",
            "SYS_UpdateGrid": "업데이트중..",
            "SYS_CollapseAll": "접기 처리중..",
            "SYS_ExpandAll": "펼침 처리중..",
            "SYS_Render": "표시하는중..",
            "SYS_Page": "",
            "SYS_NoPages": "",
            "SYS_UpdateCfg": "설정처리중..",
            "SYS_StartErr": "<b style='color:#ff6600;'>그리드 표시중 오류가 발생하였습니다.</b>",
            "SYS_Calculate": "계산중..",
            "SYS_UpdateValues": "값 업데이트중..",
            "SYS_UpdateTree": "트리 업데이트중..",
            "SYS_PageErr": "데이타 영역을 다운로드할 수 없습니다.",
            "SYS_Layout": "",
            "SYS_Load": "잠시만 기다려주십시오..",
            "SYS_ColumnsCaption": "선택 컬럼 표시",
            "SYS_ColUpdate": "컬럼 업데이트중..",
            "SYS_Picture": "이미지",
            "SYS_DefaultsDate": "일자 선택 ...",
            "SYS_DefaultsButton": "선택 ...",
            "SYS_GroupCustom": "헤더 타이틀을 이곳에 끌어놓으십시오.",
            "SYS_Group": "그룹핑중..",
            "SYS_DefaultsFilterOff": "전체",
            "SYS_Items": "아이템 %d - %d",
            "SYS_Print": "<h2><center>인쇄를 준비하는 동안 잠시 기다려 주십시오.</center></h2>",
            "SYS_SearchMethodList": "",
            "SYS_Contains": "",
            "SYS_Starts": "",
            "SYS_Ends": "",
            "SYS_And": "and",
            "SYS_Or": "or",
            "SYS_Not": "",
            "SYS_SearchSearch": "조회",
            "SYS_SearchFilter": "필터",
            "SYS_SearchSelect": "선택",
            "SYS_SearchMark": "마킹",
            "SYS_SearchFind": "찾기",
            "SYS_SearchClear": "초기화",
            "SYS_SearchHelp": "도움말",
            "SYS_Search": "조회중 ...",
            "SYS_Printed": "Please switch to window containing the report to print it",
            "SYS_DoUndo": "실행취소 처리중..",
            "SYS_DoRedo": "다시실행 처리중..",
            "SYS_LoadStyles": "스타일을 로딩중입니다 ...",
            "SYS_SetStyle": "스타일 업데이트중..",
            "SYS_LoadPage": "로딩하는중",
            "SYS_RenderPage": "표시하는중",
            "SYS_ColWidth": "컬럼폭을 조정하고 있습니다. '%d'",
            "SYS_ColMove": "컬럼을 이동중입니다. '%d'",
            "SYS_Password": "***",
            "SYS_DefaultsNone": "모두 지우기",
            "SYS_RadioFilterOff": "",
            "SYS_DragObjectMove": "이동 행 <b style='color:green;'>%d</b>",
            "SYS_DragObjectCopy": "복사 행 <b style='color:green;'>%d</b>",
            "SYS_DragObjectMoreMove": "<b style='color:blue;'>%d</b> 개 행 이동",
            "SYS_DragObjectMoreCopy": "<b style='color:blue;'>%d</b> 개 행 복사",
            "SYS_ExportFinished": "<center><b>파일이 생성되었습니다.</b><br/><br/>버튼을 클릭하십시오<br/></center><br/>",
            "SYS_RenderProgressCaption": "페이지 표시",
            "SYS_RenderProgressText": "%d 페이지 중 %d 페이지가 완료되었습니다.",
            "SYS_RenderProgressCancel": "",
            "SYS_PrintProgressCaption": "파일 생성",
            "SYS_PrintProgressText": "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_PrintProgressCancel": "취소",
            "SYS_ExportProgressCaption": "파일 생성",
            "SYS_ExportProgressText": "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_ExportProgressCancel": "취소",
            "SYS_ExpandProgressCaption": "모든행을 확장",
            "SYS_ExpandProgressText": "총 %d 개의 행중 %d 개 행이 완료되었습니다.",
            "SYS_ExpandProgressCancel": "확장을 멈춤",
            "SYS_ExportCaption": "다운로드할 컬럼을 선택",
            "SYS_PrintCaption": "출력할 컬럼을 선택",
            "SYS_DefaultsAll": "모두 선택",
            "SYS_DefaultsAlphabet": "%d ...",
            "SYS_PrintRows": "페이지별 최대 표시 행의 개수",
            "SYS_PrintExpanded": "",
            "SYS_PrintFiltered": "모든행 출력",
            "SYS_PrintOptions": "프린트 옵션",
            "SYS_ExportOptions": "Export 옵션",
            "SYS_ExportFormat": "파일 포맷",
            "SYS_ExportFormats": "XLS,CSV",
            "SYS_ExportExpanded": "",
            "SYS_ExportFiltered": "모든행 내보내기",
            "SYS_ExportOutline": "Export tree in Excel outline",
            "SYS_ExportIndent": "Indent tree in main column",
            "SYS_RemoveUnused": "미사용 페이지 삭제",
            "SYS_ErrorSave": "저장중 오류가 발생하였습니다.",
            "SYS_DatesRepeat": "반복",
            "SYS_DatesStart": "시작",
            "SYS_DatesEndTime": "마지막",
            "SYS_DatesValue": "값",
            "SYS_DatesRepeatEnum": "||주|일|시간",
            "SYS_DatesRepeatKeys": "||w|d|h",
            "SYS_RenderProgressCaptionRows": "행 페이지 렌더링",
            "SYS_RenderProgressCaptionCols": "컬럼 페이지 렌더링",
            "SYS_RenderProgressCaptionChildren": "트리 페이지 렌더링",
            "SYS_StatusInsert": "입력",
            "SYS_StatusUpdate": "수정",
            "SYS_StatusDelete": "삭제",
            "SYS_StatusRead": "조회",
            "SYS_SaveConfirm": "저장하시겠습니까?",
            "SYS_EmptySaveContent": "저장할 내역이 없습니다.",
            "SYS_KeyFieldEmpty": "%row 번째 행의 [%col](은)는 필수 입력 항목 입니다.",
            "SYS_SubSum": "소계",
            "SYS_Cumulate": "누계",
            "SYS_Sum": "합계",
            "SYS_Avg": "평균",
            "SYS_Cnt": "개수",
            "SYS_NoType": "타입이 맞지않아  편집이 불가합니다.",
            "SYS_NoEditType": "편집 불가능한 DataType 입니다.",
            "SYS_NoValueCheck": "값이 0 또는 1 이여야 합니다.",
            "SYS_LicenseError": "라이센스를 발급받으시기 바랍니다.",
            "SYS_LicenseExpired": "라이센스 기간이 만료되었습니다.",
            "SYS_MaximumBigValue": "최대값 보다 큰 값 입니다. [최대값=%d]",
            "SYS_MinimumSmallValue": "최소값 보다 작은 값 입니다. [최소값=%d]",
            "SYS_NoDataRow": "조회된 데이터가 없습니다.",
            "SYS_CloseFindDialog": "검색창을 닫으시겠습니까?",
            "SYS_FindTitle": "찾기",
            "SYS_FindContent": "찾을 내용",
            "SYS_FindColumn": "찾을 컬럼",
            "SYS_AllColumn": "전체 컬럼",
            "SYS_SelectedColumn": "선택 컬럼",
            "SYS_KindCongruence": "일치 종류",
            "SYS_AllCongruence": "모든 단어 일치",
            "SYS_FrontCongruence": "앞글자 일치",
            "SYS_BackCongruence": "뒷글자 일치",
            "SYS_MiddleCongruence": "가운데 일치",
            "SYS_StartRowPosition": "시작 위치",
            "SYS_FindFromFirstRow": "첫 행부터 찾기",
            "SYS_FindFromFocusCell": "포커스 셀 이후부터 찾기",
            "SYS_CaseSensitive": "대/소문자 구분",
            "SYS_FindWrap": "끝에서 되돌리기",
            "SYS_KeepDlg": "찾은 후 닫지않기",
            "SYS_FindDialogFindButton": "찾기",
            "SYS_FindDialogCancelButton": "취소",
            "SYS_InvalidDateFormat": "날짜 형식에 맞지 않습니다.",
            "SYS_InvalidTimeFormat": "시간 형식에 맞지 않습니다.",
            "SYS_InvalidCombo": "일치하는 콤보 항목이 없습니다.",
            "SYS_InvalidNumberFormat": "숫자 형식에 맞지 않습니다.",
            "SYS_NoFindString": "찾으려는 값이 입력되지 않았습니다. 값을 입력하세요.",
            "SYS_FullInputWarning": "%row 번째 행의 [%col]을(를) 모두 입력하십시오",
            "SYS_ExceededInputLength": "데이터의 길이제한범위를 초과하였습니다.",
            "SYS_InsertSuccess": "입력완료",
            "SYS_UpdateSuccess": "수정완료",
            "SYS_SaveSuccess": "저장완료",
            "SYS_SaveDup": "저장중복",
            "SYS_SaveMiss": "미처리",
            "SYS_SaveFail": "저장오류",
            "SYS_ColSortAsc": "오름차순 정렬",
            "SYS_ColSortDesc": "내림차순 정렬",
            "SYS_ColHidden": "컬럼 숨기기",
            "SYS_CancelColHidden": "모든 컬럼 숨기기 취소",
            "SYS_SaveColInfo": "컬럼 정보 저장",
            "SYS_ResetColInfo": "컬럼 정보 저장 취소",
            "SYS_ShowFilter": "필터행 사용",
            "SYS_HideFilter": "필터행 사용 안함",
            "SYS_InvalidGetSaveString": "KeyFieldError",
            "SYS_InvalidValue": "유효하지 않은 문자 또는 문자열이 포함되어 있습니다.",
            "SYS_SearchDesc": "조회 중 입니다.",
            "SYS_SaveDesc": "저장 중 입니다.",
            "SYS_DownloadDesc": "다운로드 중 입니다.",
            "SYS_UploadDesc": "업로드 중 입니다.",
            "SYS_ProcessDesc": "처리 중 입니다.",
            "SYS_PivotTitle": "피벗 테이블 설정",
            "SYS_PivotTargetCol1": "대상 컬럼 (일반)",
            "SYS_PivotTargetCol2": "대상 컬럼 (숫자형)",
            "SYS_PivotColLabel": "컬럼",
            "SYS_PivotRowLabel": "행",
            "SYS_PivotValueLabel": "값",
            "SYS_PivotButtonPivot": "피벗테이블",
            "SYS_PivotButtonCross": "크로스테이블",
            "SYS_PivotButtonBase": "원본시트",
            "SYS_PivotButtonInit": "초기화",
            "SYS_PivotButtonClose": "닫기",
            "SYS_PivotRatioSumRow": "행합계비율",
            "SYS_PivotRatioSumCol": "열합계비율",
            "SYS_PivotInfoMessage": "<li>대상 컬럼을 드래그하여 컬럼, 행, 값의 레이블을 설정 합니다.</li><li>컬럼과 행의 레이블에는 동일한 컬럼을 설정할 수 없습니다.</li>",
            "SYS_ExcelDone": "엑셀 데이터가 로드 되었습니다.",
            "SYS_OverMaxRow": "엑셀 데이터가 최대 행수 설정값 보다 많습니다.",
            "SYS_NoMatchedHeader": "엑셀 데이터에 시트 헤더와 동일한 정보가 없습니다.",
            "SYS_FilterTitle": "필터 입력",
            "SYS_FilterInfoMessage": "<li>검색어와 연산자는 공백으로 구분</li><li>AND 연산자 : and, 공백, &<br/>ex) 대한 and 민국</li><li>OR 연산자 : or, |<br/>ex) 대한 or 민국</li><li>범위 연산자 : ~ <br/>ex) 10 ~ 20</li><li>검색어에 연산자 또는 공백이 포함되는 경우 \"\" 사용<br/>ex) \"대한 민국\", \"You and I\"</li>",
            "SYS_InvalidPaste": "일부 셀에서 붙여넣기 작업을 실패하였습니다."
        },
        "MenuButtons": {
            "SYS_Ok": "선택",
            "SYS_Clear": "취소",
            "SYS_Today": "오늘",
            "SYS_All": "전체선택",
            "SYS_Cancel": "취소",
            "SYS_Yesterday": "어제",
            "SYS_InputEmpty": "공백",
            "SYS_EmptyTip": "공백일자"
        },
        "MenuFilter": {
            "SYS_F0": "사용안함",
            "SYS_F1": "같음",
            "SYS_F2": "같지 않음",
            "SYS_F3": "작음",
            "SYS_F4": "같거나 작음",
            "SYS_F5": "큼",
            "SYS_F6": "같거나 큼",
            "SYS_F7": "단어로 시작함",
            "SYS_F8": "단어로 시작하지 않음",
            "SYS_F9": "단어로 끝남",
            "SYS_F10": "단어로 끝나지 않음",
            "SYS_F11": "포함함",
            "SYS_F12": "포함하지 않음",
            "SYS_CheckedText": "1",
            "SYS_UnCheckedText": "0"
        },
        "Format": {
            "SYS_YearName": "년",
            "SYS_LongDayNames": "일요일,월요일,화요일,수요일,목요일,금요일,토요일",
            "SYS_ShortDayNames": "일,월,화,수,목,금,토",
            "SYS_Day2CharNames": "일,월,화,수,목,금,토",
            "SYS_Day1CharNames": "일,월,화,수,목,금,토",
            "SYS_LongMonthNames": "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_LongMonthNames2": "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_ShortMonthNames": "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월",
            "SYS_DayNumbers": "1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,11th,12th,13th,14th,15th,16th,17th,18th,19th,20th,21st,22nd,23rd,24th,25th,26th,27th,28th,29th,30th,31st",
            "SYS_Quarters": "I,II,III,IV",
            "SYS_Halves": "I,II",
            "SYS_DateSeparator": "/",
            "SYS_InputDateSeparators": "/.-",
            "SYS_TimeSeparator": ":",
            "SYS_InputTimeSeparators": ":",
            "SYS_AMDesignator": "AM",
            "SYS_PMDesignator": "PM",
            "SYS_FirstWeekDay": "0",
            "SYS_FirstWeekYearDay": "3",
            "SYS_NaD": "",
            "SYS_GMT": "0",
            "SYS_d": "yyyy/MM/dd",
            "SYS_g": "yyyy/MM/dd HH:mm",
            "SYS_G": "yyyy/MM/dd HH:mm:ss",
            "SYS_m": "yyyy/MM",
            "SYS_M": "MM/dd",
            "SYS_t": "HH:mm",
            "SYS_T": "HH:mm:ss",
            "SYS_ValueSeparator": ";",
            "SYS_ValueSeparatorHtml": ";",
            "SYS_RangeSeparator": "~",
            "SYS_RangeSeparatorHtml": "~",
            "SYS_RepeatSeparator": "#",
            "SYS_CountSeparator": "*",
            "SYS_AddSeparator": "+",
            "SYS_DecimalSeparator": ".",
            "SYS_InputDecimalSeparators": ".,",
            "SYS_GroupSeparator": ",",
            "SYS_InputGroupSeparators": "",
            "SYS_Percent": "%",
            "SYS_NaN": "",
            "SYS_ng": "0.######",
            "SYS_nf": "0.00",
            "SYS_nc": "$###########0.00",
            "SYS_np": "0.00%",
            "SYS_nr": "0.0000",
            "SYS_ne": "0.000000 E+000",
            "SYS_Cont": "...",
            "SYS_ContLeft": "...",
            "SYS_ContRight": "...",
            "SYS_EmptyDate": ""
        },
        "User": {
        }
    }
};

var _ibcfg = {
    "Cfg": {
        "Down2Excel_Url": "../aspx/Down2Excel.aspx",
        "LoadExcel_Url": "../aspx/LoadExcel.aspx",
        "Down2Text_Url":"../aspx/Down2Text.aspx",
        "LoadText_Url":"../aspx/LoadText.aspx",
        "DirectLoadExcel_Url":"../aspx/DirectLoadExcel.aspx",
        "Down2Pdf_Url": "../aspx/Down2Pdf.aspx",
        "AutoClearHeaderCheck": "1",
        "CalWeekNumber": "0",
        "CheckActionKey": "Space|Enter",
        "ClipPasteMode": "1",
        "ComboOpenMode": "1",
        "NextPageCall": "80",
        "ReverseSortOrder": "1",
        "SelectCellEventMode": "1",
        "UseCache": "1",
        "UseJsonTreeLevel": "1",
        "UseJsonAttribute": "1",
        "WaitTimeOut": "300",
        "FilterInputPopup": "1",
        "SumZeroValue": "0",
        "AutoFitColWidth":"Init|Search|Resize|ColHidden",
        "UseHeaderActionMenu":"1",
        "FilterInputPopup":"1",
        "DragPopup":"1",
        "DataTypeToInvalidMessage":"Combo",
        "UserAgent":"IBSHEET"
    }
};

var _ibcss = 
"  /* -----------------------------------------------------------------------*/"
+"/* ----------------- \"Main\" IBSheet style definition ---------------------*/"
+"/* -----------------------------------------------------------------------*/"
+""
+"/* Base tags */"
+".GMImage {padding-bottom:256px;}"
+".GMNone {display:none;}"
+".GMSection,.GMSectionFF3, .GMChildPart {table-layout:fixed; width:0;}"
+".GMSectionFF3 {border-collapse:collapse; }"
+""
+"/* Sections */"
+".GMMainTable {border:1px solid #99BCE8; border-collapse:separate; text-align:left; background:#ffffff; font:12px Dotum,Helvetica,AppleGothic,Sans-serif;}"
+".GMFootLeft,.GMFootMid,.GMFootRight {border-top:1px solid #99BCE8;}"
+".GMHeadLeft,.GMBodyLeft,.GMFootLeft,.GMHScrollLeft {border-right:1px solid #c0c0ff;}    "
+".GMHeadRight,.GMBodyRight,.GMFootRight,.GMHScrollRight {border-left:1px solid #c0c0ff;} "
+".GMVScroll {padding-top:1px; padding-bottom:1px;}"
+".GMHScrollLeft,.GMHScrollMid,.GMHScrollLeftResizeTouch,.GMHScrollRightResizeTouch {padding-left:1px; padding-right:1px; cursor:default;}"
+".GMHScrollLeftResizeTouch {border-right:2px solid #000000; padding-right:18px; background:#F4F4F4;}"
+".GMHScrollRightResizeTouch {border-left:2px solid #000000; padding-left:18px; background:#F4F4F4;}"
+".GMHScrollMidLeftResizeTouch {border-left:1px solid #000000; padding-left:19px; background:#F4F4F4;}"
+".GMHScrollMidRightResizeTouch {border-right:1px solid #000000; padding-right:19px; background:#F4F4F4;}"
+".GMHScrollWide {padding-right:1px;}"
+".GMHScrollHidden {overflow:visible !important; background:#F4F4F4; cursor:default; }"
+".GMXScroll {background:#F4F4F4;}"
+".GMPage {border-top:0px solid #E0E0E0;}"
+""
+"/* Rows */"
+".GMSpaceRowHeight{height:21px; }"
+".GMRowHeight     {height:18px; }"
+".GMRowHeightTouch{height:22px; }"
+".GMSpaceMargin   {margin:0; }"
+".GMSpaceMarginTouch{margin:0; }"
+".GMSpaceRow {background:#ffffff; white-space:nowrap; overflow:hidden; padding-top:2px; padding-bottom:2px; border-bottom:1px solid #e0e0ff;}"
+".GMGroupRow,.GMSearchRow,.GMPagerRow "
+"{background-color:#C9E1F5; white-space:nowrap; padding-top:1px; padding-bottom:1px; overflow:hidden; border-bottom:1px solid #99BCE8;} "
+".GMGroupRow,.GMPagerRow {background-position:0 -1801px; }"
+".GMFillRow {background:#ffffff; }"
+".GMRowAbove,.GMRowBelow {border-left:1px solid #9cb6c8; border-right:1px solid #9cb6c8;}"
+".GMRowAbove { margin-top:3px; overflow:hidden;}"
+".GMRowBelow {margin-bottom:3px; overflow:hidden;}"
+".GMCountRowTop {background-color:#C9E1F5; white-space:nowrap;padding-top:1px; padding-bottom:1px; overflow:hidden; border-bottom:1px solid #99BCE8;}"
+".GMCountRowBottom {background-color:#C9E1F5; white-space:nowrap; padding-top:1px; padding-bottom:1px; overflow:hidden; border-top:1px solid #99BCE8;}"
+".GMCountFont { font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif; }"
+".GMNoDataRow {padding-top:0px; padding-bottom:0px; background-color:#ffffff; color:#000000;}"
+""
+"/* Cell */"
+".GMCell,.GMCellPanel,.GMCellFilter,.GMHeaderDrag,.GMHeaderGroup "
+" {border-bottom:1px solid #e0e0ff; border-right:1px solid #e0e0ff; border-left:0; border-top:0;vertical-align:top; overflow:hidden; height:auto; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+""
+".GMCellHeader,.GMCellHeaderEmpty"
+" {vertical-align:middle; overflow:hidden;height:auto; background-color:#C9E1F5; padding-top:1px; border-right:1px solid #99BCE8; border-bottom:1px solid #99BCE8;} "
+""
+".GMHeaderGroup, .GMHeaderGroupCustom { vertical-align: middle; height:20px; text-align: center; }"
+""
+".GMCellBorderFF3 {border-left:0;border-top:0;} "
+".GMCellSpace {vertical-align:top; padding-top:5px !important; }"
+".GMCellSpacePanel,.GMCellSpaceBool {vertical-align:top; }"
+".GMCellSpaceRadio { padding-top:3px !important;}"
+".GMCellSpaceEditButton { vertical-align:top; padding-top:4px !important; border:1px solid #000000 !important; background-color:#ffffff !important; }"
+".GMCellSpaceButtonButton { vertical-align:top; }"
+".GMCellSpaceButton { vertical-align:top; padding-top:5px !important; white-space:nowrap; }"
+".GMCellSpaceAbove { border-top:1px solid #9cb6c8; }"
+".GMCellSpaceBelow { border-bottom:1px solid #9cb6c8; }"
+".GMCellPanel,.GMCellHeaderPanel{ white-space:nowrap; } "
+".GMCellHidden { background:transparent!important; border-top:none!important; border-bottom:none!important; }"
+".GMHeaderButton { padding:0; }"
+".GMHeaderGroup {background: #7FA9E6; color:#ffffff; font-weight: bold; border-radius: 5px;}"
+".GMHeaderGroupFocus {background-color: #C0C0A0; }"
+".GMHeaderGroupDelete {background-color: #F0F0E0; color: #F0F0E0; }"
+".GMHeaderGroupCustom {color:#BBB; padding-left:5px; cursor:default; white-space:nowrap; }"
+".GMHeaderDrag {background: #9FB9E9; cursor:default; overflow:hidden; }"
+".GMHeaderFocus {background: #9FB9E9;}"
+".GMPanel {padding-left:80px;}"
+".GMNoTreeLines1 {text-align:right;}"
+".GMNoTreeLines2 {text-align:right; vertical-align:middle; padding-top:0;}"
+".GMTree {padding-top:0; white-space:nowrap;}"
+".GMSpannedTree {vertical-align:top;}"
+".GMCellClassInner {padding-top:0; padding-bottom:0;}"
+""
+"/* Inside cell */"
+".GMStatus,.GMSeq,.GMPopup,.GMPopupEdit,.GMHtml,.GMText,.GMLines,.GMPass,.GMInt,.GMFloat,.GMDate,"
+".GMLink,.GMImg,.GMRadio,.GMRadioText,.GMList,.GMEnum,.GMDropCols,.GMAbs,.GMPagerEdit,.GMUser,.GMResult,.GMNumber,.GMBtn"
+" {white-space:nowrap;vertical-align: middle;padding:2px 3px;} "
+".GMInt,.GMFloat { text-align:right; }"
+".GMLines,.GMRadio,.GMHtml,.GMList { white-space:normal; }   "
+".GMImg,.GMHtml {padding:0; } "
+".GMRadio,.GMRadioText { padding:0; font-weight:normal !important; }"
+".GMBool { text-align:center; }"
+".GMIcon { background-repeat:no-repeat; }"
+".GMHiddenSpace { display:none; }"
+".GMDropCols { padding-top:2px !important; }"
+""
+".GMHeaderText {color: #15498B; vertical-align:middle; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+".GMAbs { padding:0; }"
+".GMUser { padding:0; }"
+".GMPagerEdit { text-align:right; padding-top:3px; }"
+".GMPagerTotal { text-align:left; padding-top:3px; }"
+".GMMergedCellH {padding:0 0 5px 0}"
+".GMMergedCellV {padding:0 0 1px 0}"
+""
+".GMWrap0 { white-space:nowrap; }"
+".GMWrap1 { white-space:normal; }"
+".GMEllipsis { white-space:nowrap; text-overflow:ellipsis;}"
+""
+".GMAlignLeft { text-align:left; }"
+".GMAlignCenter { text-align:center; }"
+".GMAlignJustify { text-align:center; }"
+".GMAlignRight { text-align:right;}"
+""
+".GMValignTop { vertical-align:top; }"
+".GMValignMiddle { vertical-align:middle; }"
+".GMValignBottom { vertical-align:bottom;}"
+""
+".GMCellButtonBase {"
+"    color: #fff;"
+"    display: inline-block;"
+"    padding: 2px 10px 3px;"
+"    text-decoration: none;"
+"    border-radius: 3px;"
+"    -moz-border-radius: 3px;"
+"    -webkit-border-radius: 3px;"
+"    box-shadow: 0 1px 3px rgba(0,0,0,0.5);"
+"    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);"
+"    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);"
+"    border-bottom: 1px solid rgba(0,0,0,0.25);"
+"    line-height: 1;"
+"    border:0;"
+"    font-family: \"Dotum\";"
+"    font-weight: bold;"
+"    text-shadow: 0 -1px 1px rgba(0,0,0,0.25);"
+"    height: 20px;"
+"}"
+".GMCellButton {"
+"    cursor: pointer;"
+"    background-color: #5689b9;"
+"}"
+".GMCellButton0 {"
+"    cursor:default;"
+"    background-color: #c8c8c8;"
+"}"
+".GMCellButton:hover { background-color: #3a6ea0; }"
+".GMCellButton0:hover {}"
+""
+"/* Tree Img with lines */"
+".GM000,.GM010,.GM001,.GM011,.GM100,.GM110,.GM101,.GM111, "
+".GM000T,.GM010T,.GM001T,.GM011T,.GM100T,.GM110T,.GM101T,.GM111T,"
+".GM00,.GM01,.GM10,.GM11,.GM00T,.GM01T,.GM10T,.GM11T,"
+".GM0T,.GM1T,.GM0TL,.GM1TL,.GM0C,.GM1C,.GM0CL,.GM1CL,.GM0E,.GM1E,.GM0EL,.GM1EL,"
+".GM0,.GM1,.GMT,.GMTL,.GMC,.GMCL,.GME,.GMEL,.GMD0,.GMD1,.GMD2,.GMD3,.GMD4,.GMD0L,.GMD1L,.GMD2L,.GMD3L,.GMD4L "
+"{background-image:url(Tree.gif); vertical-align:top;}"
+""
+"u.GM000,u.GM010,u.GM001,u.GM011,u.GM100,u.GM110,u.GM101,u.GM111 { padding-left:39px; }"
+"u.GM000T,u.GM010T,u.GM001T,u.GM011T,u.GM100T,u.GM110T,u.GM101T,u.GM111T { padding-left:60px; }"
+"u.GM00,u.GM01,u.GM10,u.GM11 { padding-left:26px; }   "
+"u.GM00T,u.GM01T,u.GM10T,u.GM11T { padding-left:47px; }   "
+"u.GM0T,u.GM1T,u.GM0TL,u.GM1TL,u.GM0C,u.GM1C,u.GM0CL,u.GM1CL,u.GM0E,u.GM1E,u.GM0EL,u.GM1EL { padding-left:34px; }   "
+"u.GM0,u.GM1 { padding-left:13px; }"
+"u.GMT,u.GMTL,u.GMC,u.GMCL,u.GME,u.GMEL,u.GMD0,u.GMD1,u.GMD2,u.GMD3,u.GMD4,u.GMD0L,u.GMD1L,u.GMD2L,u.GMD3L,u.GMD4L { padding-left:21px; }   "
+""
+".GM000,.GM000T{ background-position:-24px 0px; }"
+".GM010,.GM010T{ background-position:-136px 0; }"
+".GM001,.GM001T{ background-position:-272px 0; }"
+".GM011,.GM011T{ background-position:-392px 0; }"
+".GM100,.GM100T{ background-position:-512px 0; }"
+".GM110,.GM110T{ background-position:-640px 0; }"
+".GM101,.GM101T{ background-position:-768px 0; }"
+".GM111,.GM111T{ background-position:-896px 0; }"
+".GM00,.GM00T  { background-position:-37px 0;  }"
+".GM10,.GM10T  { background-position:-149px 0; }"
+".GM01,.GM01T  { background-position:-285px 0; }"
+".GM11,.GM11T  { background-position:-405px 0; }"
+".GM0,.GM0T    { background-position:-50px 0;  }"
+".GM1,.GM1T    { background-position:-298px 0; }"
+".GMT          { background-position:-63px 0;  }"
+".GM0TL        { background-position:-1032px 0; }"
+".GM1TL        { background-position:-1088px 0; }"
+".GM0C         { background-position:-1160px 0; }"
+".GM1C         { background-position:-1216px 0; }"
+".GM0CL        { background-position:-1288px 0; }"
+".GM1CL        { background-position:-1344px 0; }"
+".GM0E         { background-position:-1416px 0; }"
+".GM1E         { background-position:-1472px 0; }"
+".GM0EL        { background-position:-1544px 0; }"
+".GM1EL        { background-position:-1600px 0; }"
+".GMTL         { background-position:-1045px 0; }"
+".GMC          { background-position:-1173px 0; }"
+".GMCL         { background-position:-1301px 0; }"
+".GME          { background-position:-1429px 0; }"
+".GMEL         { background-position:-1557px 0; }"
+".GMD0         { background-position:-1664px 0; }"
+".GMD1         { background-position:-1696px 0; }"
+".GMD2         { background-position:-1728px 0; }"
+".GMD3         { background-position:-1760px 0; }"
+".GMD0L        { background-position:-1792px 0; }"
+".GMD1L        { background-position:-1824px 0; }"
+".GMD2L        { background-position:-1856px 0; }"
+".GMD3L        { background-position:-1888px 0; }"
+".GMD4         { background-position:-1920px 0; }"
+".GMD4L        { background-position:-1952px 0; }"
+""
+"/* Tree Img without lines  */"
+".GMND0,.GMND1,.GMND2,.GMND3,.GMND4,.GMNC,.GMNE,.GMNCR,.GMNER {background-image:url(TreeN.gif); background-repeat:no-repeat; vertical-align:top; }"
+"u.GMND0,u.GMND1,u.GMND2,u.GMND3,u.GMND4,u.GMNC,u.GMNE,u.GMNCR,u.GMNER { padding-left:20px; }"
+".GMND0 { background-position: -6px 0; }"
+".GMND1 { background-position: -56px 0; }"
+".GMND2 { background-position: -106px 0; }"
+".GMND3 { background-position: -156px 0; }"
+".GMND4 { background-position: -206px 0; }"
+".GMNC { background-position:right -50px;}"
+".GMNE { background-position:right -2000px;}"
+".GMNCR { background-position:-255px -50px;}"
+".GMNER { background-position:-255px -2000px;}"
+"u.GMNL { padding-left:21px; }"
+""
+"/* Cell images */"
+".GMIconLink { text-decoration:none; width:1000px; display:inline-block; }"
+".GMIconLeft,.GMIconRight,.GMIconCenter {  background-repeat:no-repeat; }"
+".GMIconLeft { background-position:left 0; padding-left:20px !important; }"
+".GMIconRight { background-position:right 0; padding-right:20px !important; }"
+".GMIconCenter { background-position:center 0; }"
+".GMPopupRight { background:url(popup.gif) no-repeat 5px center; }"
+".GMExpandLeft,.GMCollapseLeft,.GMExpandHeaderLeft,.GMCollapseHeaderLeft { padding-left:20px!important; }"
+".GMDateRight{ padding-right:20px!important;}"
+"u.GMDateRight,u.GMPopupRight { padding-right:0!important; padding-left:17px; }"
+".GMDateRight {background:url(calendar.gif) no-repeat 2px center}"
+".GMEnumRight { background:url(combo.gif) no-repeat right center; }"
+"u.GMEnumRight {padding-right:0; padding-left:17px}"
+".GMExpandLeft { background:url(ic_plus.gif) no-repeat 3px center; padding:2px 0 0  18px; _padding:0 0 0 18px }"
+".GMCollapseLeft { background:url(ic_minus.gif) no-repeat 3px center ; padding:2px 0 0  18px; _padding:0 0 0 18px }"
+""
+".GMRadio0Left,.GMRadio1Left,.GMRadio2Left,.GMRadio3Left,.GMRadioRO0Left,.GMRadioRO1Left,.GMRadioRO2Left,.GMRadioRO3Left { padding-left:17px; padding-right:10px; line-height:17px; background-repeat:no-repeat; background-position:3px 50%;}"
+".GMRadio0Right,.GMRadio1Right,.GMRadio2Right,.GMRadio3Right,.GMRadioRO0Right,.GMRadioRO1Right,.GMRadioRO2Right,.GMRadioRO3Right {line-height:17px; padding-right:17px; padding-left:10px; background-repeat:no-repeat; background-position:3px 50%;}"
+".GMRadio0Left  { background-image:url(chk2.gif); } "
+".GMRadioRO0Left  { background-image:url(chk2R.gif); } "
+".GMRadio1Left  { background-image:url(chk3.gif); } "
+".GMRadioRO1Left  { background-image:url(chk3R.gif); } "
+".GMRadio2Left  { background-image:url(chk0.gif); }"
+".GMRadioRO2Left  { background-image:url(chk0R.gif); }"
+".GMRadio3Left  { background-image:url(chk1.gif); }"
+".GMRadioRO3Left  { background-image:url(chk1R.gif); }"
+".GMRadio0Right { background-image:url(chk2.gif); } "
+".GMRadioRO0Right { background-image:url(chk2R.gif); } "
+".GMRadio1Right { background-image:url(chk3.gif); } "
+".GMRadioRO1Right { background-image:url(chk3R.gif); } "
+".GMRadio2Right { background-image:url(chk0.gif); }"
+".GMRadioRO2Right { background-image:url(chk0R.gif); }"
+".GMRadio3Right { background-image:url(chk1.gif); }"
+".GMRadioRO3Right { background-image:url(chk1R.gif); }"
+""
+"u.GMFilter0,u.GMFilter1 { padding-left:16px; }"
+".GMBool0,.GMBool0RO,.GMBool1,.GMBool1RO,.GMBool2,.GMBool2RO,.GMBool3,.GMBool3RO {background-position:center center; background-repeat:no-repeat;}"
+""
+".GMCheck0Left, .GMCheck1Left, .GMCheckRO0Left, .GMCheckRO1Left { background-repeat:no-repeat; padding-left:20px!important; background-position:3px 50%;}"
+".GMCheck0Left   { background-image:url(chk0.gif); }"
+".GMCheck1Left   { background-image:url(chk1.gif); }"
+".GMCheckRO0Left { background-image:url(chk0R.gif); }"
+".GMCheckRO1Left { background-image:url(chk1R.gif); }"
+""
+".GMBool0   { background-image:url(chk0.gif);  }"
+".GMBool0RO { background-image:url(chk0R.gif); }"
+""
+".GMBool1   { background-image:url(chk1.gif);  }"
+".GMBool1RO { background-image:url(chk1R.gif); }"
+""
+".GMBool2   { background-image:url(chk2.gif);  }"
+".GMBool2RO { background-image:url(chk2R.gif); }"
+""
+".GMBool3   { background-image:url(chk3.gif);  }"
+".GMBool3RO { background-image:url(chk3R.gif); }"
+""
+"/* Filter images  */"
+".GMFilter0Left,.GMFilter1Left,.GMFilter2Left,.GMFilter3Left,.GMFilter4Left,.GMFilter5Left,.GMFilter6Left,.GMFilter7Left,"
+".GMFilter8Left,.GMFilter9Left,.GMFilter10Left,.GMFilter11Left,.GMFilter12Left {width:100%; height:18px; padding-left:18px;}"
+""
+".GMFilter0Left,.GMFilter0Menu   { background:url(filter0.gif) no-repeat left center; }   "
+".GMFilter1Left,.GMFilter1Menu   { background:url(filter1.gif) no-repeat left center; }"
+".GMFilter2Left,.GMFilter2Menu   { background:url(filter2.gif) no-repeat left center; }"
+".GMFilter3Left,.GMFilter3Menu   { background:url(filter3.gif) no-repeat left center; }"
+".GMFilter4Left,.GMFilter4Menu   { background:url(filter4.gif) no-repeat left center; }"
+".GMFilter5Left,.GMFilter5Menu   { background:url(filter5.gif) no-repeat left center; }   "
+".GMFilter6Left,.GMFilter6Menu   { background:url(filter6.gif) no-repeat left center; }"
+".GMFilter7Left,.GMFilter7Menu   { background:url(filter7.gif) no-repeat left center; }"
+".GMFilter8Left,.GMFilter8Menu   { background:url(filter8.gif) no-repeat left center; }"
+".GMFilter9Left,.GMFilter9Menu   { background:url(filter9.gif) no-repeat left center; }"
+".GMFilter10Left,.GMFilter10Menu { background:url(filter10.gif) no-repeat left center; }"
+".GMFilter11Left,.GMFilter11Menu { background:url(filter11.gif) no-repeat left center; }"
+".GMFilter12Left,.GMFilter12Menu { background:url(filter12.gif) no-repeat left center; }"
+""
+".GMFilter0Menu,.GMFilter1Menu,.GMFilter2Menu,.GMFilter3Menu,.GMFilter4Menu,.GMFilter5Menu,.GMFilter6Menu,.GMFilter7Menu,.GMFilter8Menu,.GMFilter9Menu,"
+".GMFilter10Menu,.GMFilter11Menu,.GMFilter12Menu {width:18px; height:18px; overflow:hidden; margin: -2px 0 0 -1px;}"
+".GMFilterMenuHeader { padding-left:2px; border-bottom:0 !important; } "
+""
+"/*  Keyfield Image */"
+".GMKeyfield {background-image:url(keyfield.gif); display:inline-block; vertical-align:middle; background-repeat: no-repeat; background-position:center 1px; padding: 0 2px 0 4px; }"
+""
+".GMStatusR,.GMStatusI,.GMStatusU,.GMStatusD {background-position:center center; background-repeat:no-repeat;}"
+".GMStatusI   { background-image:url(status_i.gif); }"
+".GMStatusU   { background-image:url(status_u.gif); }"
+".GMStatusD   { background-image:url(status_d.gif); }"
+""
+"/* GMKeyfield : hack OP*/"
+" @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) "
+" { .GMKeyfield{  background-position: center 3px;padding: 0 2px 0 4px; }}"
+""
+"/* CheckBox Header Image */"
+".GMCheckHeader0 {background-image:url(chk0.gif); display:inline-block; vertical-align:middle; background-repeat:no-repeat; background-position:5px 1px; padding:2px 7px 0 6px; margin:0 2px 0 0;}"
+""
+"/* GMCheckHeader0 : hack CR,SF*/"
+"@media screen and (-webkit-min-device-pixel-ratio:0) "
+"{.GMCheckHeader0{ background-position:6px 1px ; padding: 2px 8px 0 6px; }}"
+""
+"/* GMCheckHeader0 : hack FF*/"
+".GMCheckHeader0, x:-moz-any-link, x:default { background-position:6px 1px ; padding: 2px 8px 0 6px; }"
+""
+"/* GMCheckHeader0 : hack OP*/"
+" @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) "
+" { .GMCheckHeader0{ background-position:7px center ; padding:1px  17px 0 0; }}"
+""
+".GMCheckHeader1 {background-image:url(chk1.gif); display:inline-block; vertical-align:middle; background-repeat:no-repeat; background-position:4px 1px ; padding:2px 6px 0 6px; margin:0 2px 0 0}"
+""
+"/* GMCheckHeader1 : hack CR,SF*/"
+"@media screen and (-webkit-min-device-pixel-ratio:0) "
+"{.GMCheckHeader1{ background-position:6px 1px ; padding: 2px 8px 0 6px; }}"
+""
+"/* GMCheckHeader1 : hack FF*/"
+".GMCheckHeader1, x:-moz-any-link, x:default { background-position:6px 1px ; padding: 2px 8px 0 6px; }"
+""
+"/* GMCheckHeader1 : hack OP*/"
+" @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) "
+" { .GMCheckHeader1 { background-position:7px center ; padding:1px  17px 0 0;  }}"
+""
+"/* Sort images */"
+".GMSort {display:block; float:right; margin:2px 2px 0; width:7px;}"
+""
+"/* State classes */"
+"/* The colors must be set by numbers not by names */"
+".GMColorDefault  { background-color:#FFFFFF;}"
+".GMColorNoFocus  { background-color:#E8F4FF;}"
+".GMColorReadOnly { background-color:#F4F4F4;}"
+".GMColorPreview  { background-color:#FFFFFF;}"
+".GMColorAlternate{ background-color:#EBFFFF;}"
+".GMColorSelected { background-color:/*#FFFF80*/#aadbff; }"
+""
+".GMColorFilter {background-color:#FFFFFF;}"
+""
+"/*//.GMClassSelected { }*/"
+".GMColorError   { background-color:#FF6969; }"
+".GMColorDeleted { background-color:#FFCDCD; }"
+".GMClassDeleted { font-style:italic; }"
+".GMColorAdded   { background-color:#CDFFCD; }"
+".GMClassAdded   { font-weight:bold; }"
+".GMColorMoved1  { background-color:#FFFFFF; }"
+".GMColorMoved2  { background-color:#D7EBEB; }"
+".GMColorChanged { background-color:#EBEBFF; }"
+".GMColorChangedCell { background-color:#E1E1FF; }"
+".GMClassChangedCell { font-weight:bold; }"
+".GMColorMaxChildren { background-color:#FFFFF0; }"
+".GMColorDetail { background-color:#FFF0FF; }"
+".GMColorDetailSelected { background-color:#FFF0E0; }"
+".GMColorDragged{ background-color:#E0E0C0; }"
+".GMColorFound1 { background-color:#FF87FF; }"
+".GMColorFound2 { background-color:#FFC387; }"
+".GMColorFound3 { background-color:#87FF87; }"
+""
+".GMColorHovered             { background-color:#f4edfe; }"
+".GMColorHoveredCell         { background-color:#d7c6ee; }"
+".GMColorHoveredCellReadOnly { background-color:#d7c6ee; }"
+".GMColorHoveredCellSpace    { background-color:#FFFFFF; }"
+".GMColorHoveredCellSpaceEdit{ background-color:#C0C0FF; }"
+".GMColorHoveredCellSpaceBool{ background-color:#FFFFFF; }"
+".GMColorHoveredCellButton   { background-color:#d0dde7; }"
+".GMColorHoveredCellButton1  { background-color:#add4f5; }"
+""
+".GMColorFocused             { background-color:#e9f5d0; }"
+".GMColorFocusedCell         { background-color:#FFFFFE; }"
+".GMColorFocusedCellSpace    { background-color:#E6E6E6; }"
+".GMColorFocusedCellButton   { background-color:#BCD; }"
+".GMColorFocusedCellHeader   { background-color:#FFFFFE; }"
+".GMColorFocusedCellPanel    { background-color:#FFFFFE; }"
+".GMColorEditedCell          { background-color:#FFFFFF; }"
+".GMColorViewedCell          { background-color:#FFFFFF; }"
+""
+"/* Hover, focus, edit cursors */"
+".GMHoverRowBackground 	{ opacity:0.2; filter:alpha(opacity=20); background:#8238f0; } /* 일반모드에서의 Hover Row의 Background*/"
+".GMHoverRowBorder		{ z-index:0; border-top:1px solid #bda7dc; border-bottom:1px solid #bda7dc; } /* 일반모드에서의 Hover Row의 Border*/"
+".GMHoverCellBorder 		{ z-index:0; border:1px solid #bda7dc; cursor:default; } /* 일반모드에서의 Hover Cell의 Border*/"
+".GMFocusRowBackground   { opacity:0.1; filter:alpha(opacity=20); background:/*IBSB*/#b6d102; } /* <-- Sheet : Selected Row Background */"
+".GMFocusRowBorder       { z-index:0; border:1px solid /*IBSB*/#D6E581; } /* <-- Sheet : Selected Row Border */"
+".GMFocusCellBorder      { z-index:0; border:2px solid /*IBSB*/#CCE24C; } /* <-- Sheet : Selected Cell Border */"
+".GMFocusCellSpaceBorder,.GMEditCellSpaceBorder { z-index:4; }"
+".GMEditCellBorder       { z-index:0; border:2px solid #FF6666;}    /*<-- Sheet : CellEdit Border */"
+".GMEditCellInput        { position:relative; border:0 solid #39aefb; overflow:hidden; z-index:2; } "
+""
+".GMCursorBackground, .GMCursorBorderLeft ,.GMCursorBorderRight,.GMCursorBorderTop,.GMCursorBorderBottom "
+" {position:relative;overflow:hidden;}"
+""
+".GMCursorBackground  {border:none; padding:0;}"
+".GMCursorBorderLeft  {padding-right:0; padding-top:0; padding-bottom:0; border-right:none; border-top:none; border-bottom:none;  width:0; height:0;}"
+".GMCursorBorderRight {padding-left:0; padding-top:0; padding-bottom:0; border-left:none; border-top:none; border-bottom:none;  width:0; height:0;}"
+".GMCursorBorderTop   {padding-bottom:0; padding-left:0; padding-right:0; border-bottom:none; border-left:none; border-right:none;  width:0; height:0;}"
+".GMCursorBorderBottom{padding-top:0; padding-left:0; padding-right:0; border-top:none; border-left:none; border-right:none; width:0; height:0;}"
+""
+"/* Cell edges */"
+".GMNoLeft { border-left:0; }"
+".GMNoRight { border-right:0; }"
+""
+"/* Dragging */"
+".GMMouseObject { opacity:0.5; filter:alpha(opacity=50); z-index:300; overflow:hidden;}"
+".GMDragObject {z-index:300; margin-left:10px; margin-top:10px; padding-left:3px; padding-right:3px;background:#E4E5F0 ; border:1px solid #777;}"
+".GMDragColInsideTop,.GMDragColInsideBottom,.GMDragColOutsideTop,.GMDragColOutsideBottom{position:absolute;width:10px; height:11px; overflow:hidden; z-index:258;}"
+".GMDragColInsideTop     {background:url(in_top.gif) no-repeat;}     "
+".GMDragColInsideBottom  {background:url(in_bottom.gif) no-repeat;}  "
+".GMDragColOutsideTop    {background:url(out_top.gif) no-repeat;}    "
+".GMDragColOutsideBottom {background:url(out_bottom.gif) no-repeat;}  "
+""
+"/* Messages */"
+".GMDisabled{position:absolute; z-index:264; background:#ffffff; opacity:0.5; filter:alpha(opacity=50); } "
+".GMProcess {position: absolute; left:0; top:0; background:#E2F0FF; border:1px solid #777; white-space:nowrap; text-align:center; visibility:hidden; z-index:266;}"
+".GMMessage {background:#E2F0FF; border:1px solid #000000; padding:10px; white-space:nowrap; text-align:center;"
+"             position: absolute; left:0; top:0; visibility:hidden; z-index:266;}"
+".GMMessageShadow "
+"{position:absolute; margin-left:3px; margin-top:3px; z-index:265;background:#888; opacity:0.5; filter:alpha(opacity=50); left:0; top:0; visibility:hidden;}"
+"      "
+"/* Other */"
+"/* !!! No .GM style prefix here !!! */"
+".GridTmpTag { position:absolute; left:5px; top:5px; visibility:hidden; }"
+""
+"/* Popup menus */"
+".GMMenuMain  {position:absolute;left:0;top:0; z-index:258;}"
+".GMMenuOuter {overflow:hidden; border:1px solid #000000; background:#fff; padding:1px; margin:1px;}"
+".GMMenuHeader{overflow:hidden; position:absolute; z-index:258;border:1px solid #b0b0c0; background:#fff; cursor:pointer; _cursor:hand;}"
+".GMMenuHead {color:#15498B; cursor:pointer; text-align:left; font-weight:bold; padding-top:5px; padding-bottom:4px;"
+"    background: #c9e1f5; /* Old browsers */"
+"    background: -moz-linear-gradient(top,  #c9e1f5 0%, #99bce8 100%); /* FF3.6+ */"
+"    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#c9e1f5), color-stop(100%,#99bce8)); /* Chrome,Safari4+ */"
+"    background: -webkit-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Chrome10+,Safari5.1+ */"
+"    background: -o-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Opera 11.10+ */"
+"    background: -ms-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* IE10+ */"
+"    background: linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* W3C */"
+"    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#c9e1f5', endColorstr='#99bce8',GradientType=0 ); /* IE6-9 */"
+"}"
+".GMMenuClose {float:right!important; width:14px; cursor:pointer; _cursor:hand; display:none;}"
+".GMMenuBody {cursor:default; background-color:#fff; padding-top:1px; padding-bottom:1px;}"
+".GMMenuShadow {position:absolute;margin:3px 0 0 3px;z-index:257;background-color:#888; opacity:0.5; filter:alpha(opacity=50);}"
+".GMMenuCheckedIconRight {padding-right:17px; background:url(chk1.gif) no-repeat 96% center; }"
+".GMMenuUncheckedIconRight { padding-right:17px;background:url(chk0.gif) no-repeat 96% center ; }"
+""
+".GMMenuCursorIcon {background-image:url(d_gray_right.gif); background-repeat:no-repeat; background-position: 3px center;_background-color:#fff}"
+".GMMenuHoverIcon {background-image:url(d_right.gif); background-repeat:no-repeat; background-position: 3px center; _background-color:#ffeeaa }   "
+""
+".GMMenuNextIcon { padding-right:10px; }"
+".GMMenuNextIconRtl { padding-left:10px; }"
+""
+".GMMenuItemText,.GMMenuItemIcon,.GMMenuEnum,.GMMenuEnumHeader,.GMMenuEdit,.GMFilterMenuItemText "
+"{white-space:nowrap; overflow:hidden; vertical-align: middle; padding:1px 0 0 0; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+".GMMenuItemDisabled {opacity:0.50; filter:alpha(opacity=30); overflow:hidden; }"
+".GMMenuLevel {color:blue;text-align:center; }  "
+".GMMenuEnumParent,.GMMenuEditParent {padding-left:5px; padding-right:2px}"
+".GMMenuItemIcon {background-repeat:no-repeat;}"
+".GMMenuEnum {border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; padding-left:15px; overflow:hidden;}"
+".GMMenuEnumHeader  {padding:1px 0 2px 16px; cursor:default; } "
+".GMMenuEdit{border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; background:white; overflow:hidden;white-space:nowrap;"
+"  padding-left:2px; padding-right:2px;}"
+".GMMenuEditInput,.GMMenuEditTextarea {margin:0;padding:0;border:0; background:#FDD;_margin:-1px; _padding-right:1px; _padding_left:1px; }   "
+".GMMenuEditTextarea { line-height:13px;  }   "
+".GMMenuEditInt,.GMMenuEditFloat,.GMMenuEditDate { text-align:right; } "
+".GMMenuEditMulti { white-space:normal; }"
+".GMMenuItem {background-color:#ffffff;padding:2px;}  "
+".GMMenuItemHover {background-color:#ffeeaa; border:1px solid #aaaadd;margin:0 1px; padding:1px 0;}"
+".GMMenuFocusHover {margin:1px; background-color:#CAE1F3; border:1px solid #000000;}"
+".GMMenuFocus      {margin:1px; background-color:#CAE1F3; border:1px solid #aaaadd;}"
+".GMMenuSeparator {margin:1px 3px 0 3px; height:1px; border-top:1px solid #aaaadd; overflow:hidden;}"
+".GMMenuCaption {padding:2px; background:#ffffff; color:blue; text-align:center;}"
+".GMMenuVSeparator { border-right:1px solid #DDD; }"
+".GMMenuFoot { border-top:none; text-align:center; white-space:nowrap; }"
+".GMMenuButton {font-size:11px;background:#dcecf8; text-align:center; border:1px solid #8a8fb5;margin:5px 2px 4px 2px;padding:0;white-space:nowrap;width:48px;} "
+".GMMenuButtonHover { background:#ffeeaa; border:1px solid #aaaadd; }"
+""
+".GMEnumMenuItem {background-color:#ffffff;padding:2px;padding-top:0px;padding-bottom:0px;}  "
+".GMEnumMenuFocus      {margin:1px; background-color:#CAE1F3; border:1px solid #aaaadd;}"
+".GMEnumMenuFocusHover {margin:1px; background-color:#CAE1F3; border:1px solid #000000;}"
+".GMEnumMenuItemHover {background-color:#ffeeaa; border:0px solid #aaaadd;margin:0 1px; padding:1px;padding-top:0px;padding-bottom:0px;}"
+".GMEnumMenuColBorderColor {border-color:#e0e0ff; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+""
+".GMSuggestMenuItem {background-color:#ffffff;padding:2px;padding-top:0px;padding-bottom:0px;}  "
+".GMSuggestMenuFocus       {margin:1px; background-color:#CAE1F3; border:1px solid #aaaadd;}"
+".GMSuggestMenuFocusHover {margin:1px; background-color:#CAE1F3; border:1px solid #000000;}"
+".GMSuggestMenuItemHover {background-color:#ffeeaa; border:0px solid #aaaadd;margin:0 1px; padding:1px;padding-top:0px;padding-bottom:0px;}"
+".GMSuggestMenuColBorderColor {border-color:#e0e0ff;}"
+""
+"/* Grid configuration menus */"
+".GMCfgMenuOuter,.GMColumnsMenuOuter { border:1px solid #000000; }"
+".GMCfgMenuHead,.GMColumnsMenuHead { padding-left:3px; }"
+".GMCfgMenuBody,.GMColumnsMenuBody { padding-left:4px; padding-right:4px;}"
+".GMCfgMenuFoot,.GMColumnsMenuFoot { padding-right:3px; padding-left:3px;}"
+".GMCfgMenuButton { width:70px; } "
+".GMCfgMenuItemText,.GMColumnsMenuItemText { padding-left:3px; }"
+".GMColumnsMenuItemText { white-space:nowrap; }"
+".GMCfgMenuItem,.GMColumnsMenuItem { padding-top:3px; padding-bottom:3px;}"
+".GMCfgMenuItemHover,.GMCfgMenuFocus,.GMCfgMenuFocusHover,"
+".GMColumnsMenuItemHover,.GMColumnsMenuFocus,.GMColumnsMenuFocusHover { padding-top:2px; padding-bottom:2px;}"
+""
+"/* Popup grid dialog */"
+".GMPopupGridOuter { border:0; overflow:visible; }"
+".GMPopupGridHead { padding:0; }"
+".GMPopupGridBody { padding:0; }"
+".GMPopupGridFoot { padding:0; }"
+".GMPopupGridButton { width:50px;margin-top:-2px; margin-bottom:3px;} "
+""
+"/* Calendar */"
+"/* calendar small design */"
+".GMPickMain  {position:absolute; left:0; top:0; z-index:258; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+".GMPickOuter {overflow:hidden; background:white; padding:1px; border:1px solid #426b8c; }"
+".GMPickHeader{overflow:hidden; position:absolute; z-index:258; border:1px solid black; background:#ffffff; cursor:pointer; _cursor:hand;}"
+".GMPickHeaderBottom{border-bottom:0; padding-bottom:1px;}"
+".GMPickHeaderTop{border-top:0; padding-bottom:1px; }"
+".GMPickHead {background:#5c8397; font:10px Dotum,Verdana,Arial; color:white; cursor:default; padding-left:5px; padding-top:1px; padding-bottom:1px;border-bottom:1px solid white;}"
+".GMPickClose{float:right; width:14px; cursor:pointer; _cursor:hand; display:none;}"
+".GMPickBody {cursor:default; padding:0; }"
+".GMPickShadow{position:absolute; background:#888; z-index:257; margin:3px 0 0 3px;opacity:0.5; filter:alpha(opacity=50);} "
+".GMPickFooter,.GMPick2Footer{text-align:center; padding:2px; cursor:default; background:#EFF0F1; border-top:1px solid #E3E4E6}"
+" "
+".GMPickMY{background-color:#C9E1F5;border-bottom:1px solid #99BCE8;color:#15498B; cursor:default;text-align:center;padding:2px 0 4px 0;}"
+"   "
+".GMPickMYDown{padding-right:13px; background:url(d_down.gif) no-repeat right; cursor:pointer; _cursor:hand;}"
+".GMPickMYUp {padding-right:13px; background:url(d_up.gif) no-repeat right center; cursor:pointer; _cursor:hand;}"
+""
+".GMPickMYRtl{padding-right:0; padding-left:13px; }"
+".GMPickBL,.GMPickBR{padding-top:3px; cursor:pointer; _cursor:hand; width:16px; height:14px; overflow:hidden;}"
+""
+".GMPickBL {float:left !important; background:url(d_left.gif) no-repeat 50%; }"
+".GMPickBR {float:right !important; background:url(d_right.gif) no-repeat 50%; }"
+""
+".GMPickTable{width:160px !important;}"
+".GMPickRow  {background:#ffffff;}"
+".GMPickRowW {background:#DAEAF8;}"
+".GMPickCell {width:22px;}"
+".GMPickWDN {background:transparent; color:#333333;text-align:center; cursor:default; margin:2px 3px;padding:1px;}"
+""
+".GMPickHover,.GMPickSelHover,.GMPickWD,.GMPickSa,.GMPickSu,.GMPickHo,.GMPickSel,.GMPickNow,.GMPickWDNE,.GMPickSaNE,.GMPickSuNE,"
+".GMPickSelNE,.GMPickNowNE,.GMPickOM,.GMPickOMNE {text-align:center; border:1px solid #ffffff; cursor:pointer; _cursor:hand;margin:2px 3px;}"
+".GMPickWN,.GMPickWNE {text-align:center; cursor:pointer; _cursor:hand;padding:3px 4px; border-right:1px solid #8CA9E1; background:#EFF0F1; white-space:nowrap;}"
+""
+".GMPickWDNE,.GMPickSaNE,.GMPickSuNE,.GMPickSelNE,.GMPickNowNE,.GMPickWNE {cursor:default;}"
+".GMPickWD{background-color:#ffffff;}"
+".GMPickSa{background-color:#ffffff; color:blue;}"
+".GMPickSu{background-color:#ffffff; color:red;}"
+".GMPickHo {background-color:#ffffff; color:orange;}"
+".GMPickSel{background-color:#fbea54; border:1px solid #dad1d1;}"
+".GMPickSelNE{background-color:#fbea54; border:1px solid #dad1d1;}"
+".GMPickNow {background-color:#c0f3ff; border:1px solid #dad1d1;}"
+".GMPickNowNE{background-color:#c0f3ff; border:1px solid #dad1d1;}"
+".GMPickHover{background-color:#ddd; border:1px solid #ddd;}"
+".GMPickSelHover{background-color:#eeeeaa; border:1px solid #ddd;}"
+".GMPickOM{background-color:white; color:#aaaaaa;}"
+".GMPickOMNE{color:#aaaaaa;}"
+""
+".GMPickEmpty{background:url(d_blank.gif) no-repeat 50%; cursor:pointer; _cursor:hand;padding:3px 0; }"
+""
+".GMPickTimeCell "
+"{text-align:right; padding-bottom:4px; padding-top:6px; padding-right:5px; border-top:1px solid #8CA9E1; background:#EFF0F1; width:120px;}"
+""
+".GMPickTime "
+"{border:0px none; white-space:nowrap; text-align:right; background:#EFF0F1;}"
+""
+".GMPickButton{background:#dcecf8; text-align:center; border:1px solid #8a8fb5; width:45px; height:16px; font:inherit;}"
+"    "
+".GMPickButtonHover{background:#ffeeaa; border:1px solid #aaaadd; }"
+".GMPick2Table{width:158px !important; vertical-align:middle}"
+".GMPick2CellM{height:20px; width:55px; }"
+".GMPick2CellY{height:20px; width:35px; vertical-align:middle }"
+".GMPick2CellSep{height:20px; width:5px; }"
+".GMPick2Cell{vertical-align:middle}"
+".GMPick2M,.GMPick2Y,.GMPick2MSel,.GMPick2YSel,.GMPick2MHover,.GMPick2YHover,.GMPick2MSelHover,.GMPick2YSelHover"
+"{cursor:pointer; _cursor:hand; text-align:center; margin-left:1px; margin-right:1px; padding-left:4px; padding-right:4px; overflow:hidden; }"
+"   "
+".GMPick2MSel,.GMPick2YSel {background:#c0f3ff; border:1px solid #dad1d1; margin-left:0; margin-right:0;}"
+".GMPick2MHover,.GMPick2YHover {background:#DDD; border:1px solid #ffffff; margin-left:0; margin-right:0;}"
+".GMPick2MSelHover,.GMPick2YSelHover {background:#80e0f0; border:1px solid #ffffff;margin-left:0; margin-right:0;}   "
+".GMPick2SepH {width:1px; height:1px; overflow:hidden; }"
+".GMPick2Sep {width:1px; background:#E3E4E6; overflow:hidden; margin-left:2px; margin-right:2px; height:20px;}"
+".GMPick2BL,.GMPick2BR {width:35px; cursor:pointer; _cursor:hand; }"
+""
+""
+".GMPick2BL {background:url(d_left2.gif) no-repeat center center}"
+".GMPick2BR {background:url(d_right2.gif) no-repeat center center}"
+""
+"/* calendar large design */"
+"/*"
+".GMPickMain { position:absolute; left:0px; top:0px; z-index:258; font-size:12px; font-family:\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+".GMPickOuter { overflow:hidden; border:1px solid black; background:white; }"
+".GMPickHeader { overflow:hidden; position:absolute; z-index:258; border:1px solid black; background:white; cursor:pointer; _cursor:hand; }"
+".GMPickHeaderBottom { border-bottom:0px none; padding-bottom:1px; }"
+".GMPickHeaderTop { border-top:0px none; padding-bottom:1px; }"
+".GMPickHead { background:white; font:bold 13px \"Microsoft Sans Serif\",Arial; cursor:default; padding-left:5px; padding-top:3px; padding-bottom:4px; }"
+".GMPickClose { float:right; width:14px; cursor:pointer; _cursor:hand; display:none; background:url(Menu.gif) no-repeat right -353px; }"
+".GMPickBody { cursor:default; border:none;}"
+".GMPickShadow { position:absolute; background:#888; z-index:257; margin-left:3px; margin-top:3px; opacity:0.5; filter:alpha(opacity=50); }   "
+".GMPickFooter,.GMPick2Footer { border-top:1px solid #E3E4E6; background:#EFF0F1; color:blue; cursor:default; padding:2px; text-align:center; }"
+""
+".GMPickMY{background-color:#0062b1; color:white; cursor:default; text-align:center; padding:4px 0 4px 0;}"
+""
+".GMPickMYNone { font:15px \"Microsoft Sans Serif\",Arial; padding-right:13px; }"
+".GMPickMYDown { font:15px \"Microsoft Sans Serif\",Arial; padding-right:13px; background:url(d_l_down.gif) no-repeat right; cursor:pointer; _cursor:hand; }   "
+".GMPickMYUp { font:15px \"Microsoft Sans Serif\",Arial; padding-right:13px; background:url(d_l_up.gif) no-repeat right; cursor:pointer; _cursor:hand; }"
+".GMPickMYRtl { padding-right:0px; padding-left:13px; }"
+""
+".GMPickBL,.GMPickBR { padding-top:10px; cursor:pointer; _cursor:hand; width:16px; overflow:hidden; }"
+".GMPickBL { float:left !important; background:url(d_l_left.gif) no-repeat 50%;}"
+".GMPickBR { float:right !important; background:url(d_l_right.gif) no-repeat 50%;}"
+""
+".GMPickTableParent { padding-left:3px; padding-right:5px; padding-bottom:5px; padding-top:3px; clear:both; }"
+".GMPickTable { width:240px !important; }"
+".GMPickRow { background:white; }"
+".GMPickRowW { background:#a8daff;}   "
+".GMPickCell { width:30px;}"
+".GMPickWDN {"
+"   text-align:center; padding:1px; color:#010101;"
+"   padding-left:3px; padding-right:3px; padding-top:2px; padding-bottom:2px;border-left:1px solid #fff;"
+"   font:15px \"Microsoft Sans Serif\",Arial; cursor:default;"
+"   }"
+".GMPickHover,.GMPickSelHover,.GMPickWD,.GMPickSa,.GMPickSu,.GMPickHo,.GMPickSel,.GMPickNow,.GMPickWDNE,.GMPickSaNE,.GMPickSuNE,.GMPickSelNE,.GMPickNowNE,.GMPickOM,.GMPickOMNE {"
+"   text-align:center; padding-top:4px; padding-bottom:4px; padding-left:3px; padding-right:3px;"
+"   font:15px \"Microsoft Sans Serif\",Arial; cursor:pointer; _cursor:hand;border-bottom:1px solid #e4e4e4;border-right:1px solid #e4e4e4;"
+"   }"
+".GMPickWN,.GMPickWNE { "
+"   text-align:center; font:15px \"Microsoft Sans Serif\",Arial; cursor:pointer; _cursor:hand;"
+"   padding-left:4px; padding-right:4px; padding-top:4px; padding-bottom:4px;"
+"   background:#488; color:white;"
+"   }"
+".GMPickWDNE,.GMPickSaNE,.GMPickSuNE,.GMPickSelNE,.GMPickNowNE,.GMPickWNE { cursor:default; background-color:#e4e4e4; color:#000; border-bottom:1px solid #d0d0d0; border-left:1px solid #d0d0d0;}"
+".GMPickWD { background-color:#fff; }"
+".GMPickSa { color:#0d3def; } "
+".GMPickSu { color:#e40505; } "
+".GMPickHo { color:orange; } "
+".GMPickSel { color:#05467c;font-weight:bold;background-color:#e4e4e4; }"
+".GMPickSelNE { color:#05467c;font-weight:bold;background-color:#e4e4e4; }"
+".GMPickNow { background-color:#a8daff; }"
+".GMPickNowNE { background-color:#ffe0ff; }"
+".GMPickOM { background-color:inherit; color:#c1c1c1; }"
+".GMPickOMNE { color:#aaaaaa; }"
+".GMPickEmpty { background:url(d_blank.gif) no-repeat 50%; cursor:pointer; _cursor:hand; padding:6px 0 0 0;}"
+".GMPickHover { background-color:#DDD; }"
+".GMPickSelHover { background-color:#eeee77; }"
+""
+".GMPickTimeCell { text-align:right; background-color:white; padding-bottom:4px; padding-top:6px; padding-right:5px; }"
+".GMPickTime { font:13px Verdana,Arial; border:0px none; white-space:nowrap; text-align:right; }"
+".GMPickButton {font:14px \"Microsoft Sans Serif\",Arial; background:#dcecf8; text-align:center; border:1px solid #8a8fb5; width:60px; height:20px; font:inherit;}"
+"    "
+".GMPickButtonHover{background:#9cd0fa; border:1px solid #aaaadd; }"
+""
+".GMPick2TableParent { padding-left:3px; padding-right:3px; padding-bottom:1px; padding-top:2px; text-align:center; }"
+".GMPick2Table { vertical-align:middle; width:240px !important; }"
+".GMPick2Row { background:white;}"
+".GMPick2CellM { height:35px; width:76px; }"
+".GMPick2CellY { vertical-align:middle; height:27px; width:55px;text-align:center;}"
+".GMPick2CellSep { height:27px; width:10px; }"
+".GMPick2Cell { vertical-align:middle; height:27px; width:55px;}"
+".GMPick2M,.GMPick2Y,.GMPick2MSel,.GMPick2YSel,.GMPick2MHover,.GMPick2YHover,.GMPick2MSelHover,.GMPick2YSelHover {"
+"   font:14px \"Microsoft Sans Serif\",Arial; overflow:hidden;"
+"   margin-left:1px; margin-right:1px;"
+"   padding-left:4px; padding-right:4px; overflow:hidden;"
+"   background-color:white; cursor:pointer; _cursor:hand; text-align:center;"
+"   }"
+".GMPick2MSel,.GMPick2YSel { background-color:#d1ebff; border:1px solid #dad1d1; margin-left:0; margin-right:0;}"
+".GMPick2MHover,.GMPick2YHover { background-color:#DDD; border:1px solid #ffffff; margin-left:0; margin-right:0;}"
+".GMPick2MSelHover,.GMPick2YSelHover { background-color:#9cd0fa; border:1px solid #ffffff; margin-left:0; margin-right:0;}   "
+".GMPick2SepH { width:1px; height:1px; overflow:hidden; }"
+".GMPick2Sep { width:1px; background:#E3E4E6; overflow:hidden; margin-left:4px; margin-right:5px; height:27px; }    "
+".GMPick2BL,.GMPick2BR {width:24px !important; cursor:pointer; _cursor:hand;padding:3px 0px;margin:0 auto;}"
+".GMPick2BL { background:url(d_l_left2.gif) no-repeat center center;}"
+".GMPick2BR { background:url(d_l_right2.gif) no-repeat center center;}"
+"*/"
+""
+"/* Edit controls */"
+".GMEdit,.GMEditInline {padding:2px 4px;border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666;background:#ffffff; white-space:nowrap; overflow:hidden;}"
+"  "
+".GMEditInline { display:inline-block; vertical-align:bottom; }"
+".GMEditInput,.GMEditTextarea {border:0 solid transparent !important; margin:0; padding:0;padding-right:1px !important;vertical-align: middle; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;} "
+""
+".GMEditTextarea { line-height:13px; }"
+".GMEditSpaceInput { vertical-align:middle; }"
+".GMEditNormalInput,.GMEditNormalTextarea,.GMEditSpaceTextarea { background-color:#FFFFFF; /*#FFDCFF;*/; }"
+".GMEditInt,.GMEditFloat { text-align:right; }"
+""
+".GMEditMulti { white-space:normal; }"
+".GMEditReadOnly { background-color:#FFEEFF; }   "
+".GMEditParent { position:absolute; z-index:258; overflow:hidden; }"
+""
+".GMEnumHeaderLeft,.GMEnumHeaderRight,.GMEnumHeaderNone "
+"{background:white; cursor:pointer; _cursor:hand; vertical-align:middle; text-align:left; padding:2px 0 2px 2px; font-size:/*IBFS*/12px; font-family:/*IBFN*/\"Dotum\", \"Helvetica\", \"AppleGothic\", sans-serif;}"
+""
+".GMEnumHeaderRight {background: url(combo.gif) no-repeat right center;margin:1px 1px 0 0;}"
+" @media screen and (-webkit-min-device-pixel-ratio:0) {.GMEnumHeaderRight{margin:1px 0 0 0;}}/* hack:CR,SF */"
+".GMEnumHeaderRight, x:-moz-any-link, x:default {margin:1px 0 0 0;} /* hack:FF */"
+" @media all and (-webkit-min-device-pixel-ratio:10000), not all and (-webkit-min-device-pixel-ratio:0) {.GMEnumHeaderRight{ margin:1px 0 0 0;}}/* hack:OP */"
+""
+".GMEnumMenuHeader { background:#ffffff; }"
+""
+".GMEnumControl,.GMEnumInline {"
+"   cursor:pointer; _cursor:hand; padding-left:15px; padding-right:4px; padding-top:2px; padding-bottom:2px;"
+"   border:1px solid #DDD; border-top:1px solid #666; border-left:1px solid #666; overflow:hidden;}"
+"   "
+".GMEnumInline { display:inline-block; vertical-align:bottom; }"
+".GMEnumHeader { cursor:pointer; _cursor:hand;padding-left:15px; padding-right:4px; padding-top:2px; padding-bottom:2px;} "
+""
+"/*  Custom scrollbars  */"
+".GMCustScroll1RightHidden { background:url(VScroll.gif) left -108px; height:18px; overflow:hidden; }"
+".GMCustScroll1Right { padding-right:18px; background:url(VScroll.gif) right 0; }"
+".GMCustScroll1RightHover { padding-right:18px; background:url(VScroll.gif) right -18px; }"
+".GMCustScroll1Left { padding-left:18px;  background:url(VScroll.gif) left 0; }"
+".GMCustScroll1LeftHover { padding-left:18px;  background:url(VScroll.gif) left -18px; }"
+".GMCustScroll1SliderRight { padding-right:3px; background:url(VScroll.gif) right -36px; }"
+".GMCustScroll1SliderLeft { padding-left:3px; background:url(VScroll.gif) left -36px; }"
+".GMCustScroll1SliderHIn { height:18px; overflow:hidden; background:url(VScroll.gif) center -54px; }"
+".GMCustScroll1SliderRightHover { padding-right:3px; background:url(VScroll.gif) right -72px; }"
+".GMCustScroll1SliderLeftHover { padding-left:3px; background:url(VScroll.gif) left -72px; }"
+".GMCustScroll1SliderHInHover { height:18px; overflow:hidden; background:url(VScroll.gif) center -90px; }"
+""
+".GMCustScroll2RightHidden { background:url(VScroll.gif) left -460px; height:10px; overflow:hidden; }"
+".GMCustScroll2Right { padding-right:10px; background:url(VScroll.gif) right -400px; }"
+".GMCustScroll2RightHover { padding-right:10px; background:url(VScroll.gif) right -410px; }"
+".GMCustScroll2Left { padding-left:10px;  background:url(VScroll.gif) left -400px; }"
+".GMCustScroll2LeftHover { padding-left:10px;  background:url(VScroll.gif) left -410px; }"
+".GMCustScroll2SliderRight { padding-right:6px; background:url(VScroll.gif) right -420px; }"
+".GMCustScroll2SliderLeft { padding-left:6px; background:url(VScroll.gif) left -420px; }"
+".GMCustScroll2SliderHIn { height:10px; overflow:hidden; background:url(VScroll.gif) center -430px; }"
+".GMCustScroll2SliderRightHover { padding-right:6px; background:url(VScroll.gif) right -440px; }"
+".GMCustScroll2SliderLeftHover { padding-left:6px; background:url(VScroll.gif) left -440px; }"
+".GMCustScroll2SliderHInHover { height:10px; overflow:hidden; background:url(VScroll.gif) center -450px; }"
+""
+".GMCustScroll3Right,.GMCustScroll3RightHidden { background:white; height:9px; overflow:hidden; }"
+".GMCustScroll3SliderRight,.GMCustScroll3SliderRightHover { padding-right:3px; height:9px; background:url(VScroll.gif) right -126px; }"
+".GMCustScroll3SliderLeft,.GMCustScroll3SliderLeftHover { height:9px; background:url(VScroll.gif) left -126px; }"
+".GMCustScroll3SliderRightHover { background-position:right -135px; }"
+".GMCustScroll3SliderLeftHover { background-position:left -135px; }"
+""
+".GMCustScroll4Right,.GMCustScroll4RightHidden,.GMCustScroll4SliderRight,.GMCustScroll4SliderRightHover { height:1px; overflow:hidden; }"
+""
+".GMCustScroll1DownHidden { background:url(HScroll.gif) -108px top; width:18px; overflow:hidden; }"
+".GMCustScroll1Down { padding-bottom:18px; background:url(HScroll.gif) 0px bottom; cursor:default; width:18px; overflow:hidden; }"
+".GMCustScroll1DownHover { padding-bottom:18px; background:url(HScroll.gif) -18px bottom; width:18px; overflow:hidden; }"
+".GMCustScroll1Up { padding-top:18px; background:url(HScroll.gif) 0px top; width:18px; overflow:hidden; }"
+".GMCustScroll1UpHover { padding-top:18px;  background:url(HScroll.gif) -18px top; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderDown { padding-bottom:3px; background:url(HScroll.gif) -36px bottom; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderUp { padding-top:3px; background:url(HScroll.gif) -36px top; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderVIn { background:url(HScroll.gif) -54px center; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderDownHover { padding-bottom:3px; background:url(HScroll.gif) -72px bottom; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderUpHover { padding-top:3px; background:url(HScroll.gif) -72px top; width:18px; overflow:hidden; }"
+".GMCustScroll1SliderVInHover { background:url(HScroll.gif) -90px center; width:18px; overflow:hidden; }"
+""
+".GMCustScroll2DownHidden { background:url(HScroll.gif) -460px top; width:10px; overflow:hidden; }"
+".GMCustScroll2Down { padding-bottom:10px; background:url(HScroll.gif) -400px bottom; cursor:default; width:10px; overflow:hidden; }"
+".GMCustScroll2DownHover { padding-bottom:10px; background:url(HScroll.gif) -410px bottom; width:10px; overflow:hidden; }"
+".GMCustScroll2Up { padding-top:10px; background:url(HScroll.gif) -400px top; width:10px; overflow:hidden; }"
+".GMCustScroll2UpHover { padding-top:10px;  background:url(HScroll.gif) -410px top; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderDown { padding-bottom:6px; background:url(HScroll.gif) -420px bottom; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderUp { padding-top:6px; background:url(HScroll.gif) -420px top; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderVIn { background:url(HScroll.gif) -430px center; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderDownHover { padding-bottom:6px; background:url(HScroll.gif) -440px bottom; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderUpHover { padding-top:6px; background:url(HScroll.gif) -440px top; width:10px; overflow:hidden; }"
+".GMCustScroll2SliderVInHover { background:url(HScroll.gif) -450px center; width:10px; overflow:hidden; }"
+""
+".GMCustScroll3Down,.GMCustScroll3DownHidden { background:white; width:9px; overflow:hidden; cursor:default; }"
+".GMCustScroll3SliderDown,.GMCustScroll3SliderDownHover { padding-bottom:3px; width:9px; background:url(HScroll.gif) -126px bottom; }"
+".GMCustScroll3SliderUp,.GMCustScroll3SliderUpHover { width:9px; background:url(HScroll.gif) -126px top; cursor:default; }"
+".GMCustScroll3SliderDownHover { background-position:-135px bottom; }"
+".GMCustScroll3SliderUpHover { background-position:-135px top; cursor:default; }"
+""
+".GMCustScroll4Down,.GMCustScroll4DownHidden,.GMCustScroll4SliderDown,.GMCustScroll4SliderDownHover { width:1px; overflow:hidden; }"
+""
+"/* Other messages */"
+".GMHintMain {position:absolute; margin-left:-1px; margin-top:-1px; left:0px; top:0px; z-index:260; background:#ffffff; cursor:default; }"
+".GMHintOuter {overflow:hidden; border:1px solid #000000; background:#ffffff !important; color:black; text-align:left; }"
+".GMHintHeaderOuter {background-color:#39aefb !important; color:#ffffff; border: 1px solid #ffffff; }"
+".GMHintShadow {position:absolute; z-index:259;background:#888; opacity:0.3; filter:alpha(opacity=30);margin-left:2px; margin-top:2px;}"
+".GMTipMain {position:absolute; left:0px; top:0px; z-index:262; visibility:hidden; }"
+".GMTipOuter  {overflow:hidden; cursor:default; font:12px Arial;padding-left:3px; padding-right:3px; background:#E4E5F0; border:1px solid #777;}"
+".GMTipBody {background:#E4E5F0; white-space:nowrap; padding: 3px;}"
+".GMTipShadow {position:absolute;z-index:261;background:#888; opacity:0.3; filter:alpha(opacity=30);visibility:hidden; margin-left:3px; margin-top:3px}"
+".GMMouseOrig { background:yellow !important; opacity:0.5; filter:alpha(opacity=50); }"
+".GMMouseDragObject { position:absolute; z-index:260; background:#888; opacity:0.5; filter:alpha(opacity=50); }"
+".GMFocus { border:1px solid #AAF; border-top:1px solid #00F; border-left:1px solid #00F; background-color:#EEE; } "
+".GridDisabled { position:absolute; z-index:256; background:white; opacity:0.5; filter:alpha(opacity=50); } "
+""
+"/* Do not change, marks the style loaded */"
+".GMLoaded { border:1px solid #000000 !important;}"
+""
+"/*sum*/"
+".GMSumCell{background:#EAF1FB; color:#F30;}/*//text-align: right;font-weight:bold;*/"
+".GMSubSumCell{background: #FFFFEF; border-bottom:1px solid #F5D9CD; color:#FF6600}"
+".GMCumulateCell{background: #FFFFEF; border-bottom:1px solid #F5D9CD; color:#AE4600}"
+""
+"/* FindDialog && PivotDialog */"
+".GMH1Pop,.GMPPop{margin:0; padding:0}"
+".GMPaddingl10{padding-left:10px}"
+".GMPaddingT10{padding-top:10px}"
+".GMPPop{ padding:0 0 10px 0; text-align:center }"
+".GMPop{width:410px; overflow:hidden; border:1px solid #426B8C; padding:0; font-size:12px;background:#EBF2F5; font-family:dotum, Arial, Helvetica, sans-serif}"
+".GMPopTitle{width:100%; border-bottom:1px solid #99BCE8; font-size:12px; font-weight:bold; display:block; line-height:28px; color:#15498B;"
+"background: #c9e1f5; /* Old browsers */"
+"background: -moz-linear-gradient(top,  #c9e1f5 0%, #99bce8 100%); /* FF3.6+ */"
+"background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#c9e1f5), color-stop(100%,#99bce8)); /* Chrome,Safari4+ */"
+"background: -webkit-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Chrome10+,Safari5.1+ */"
+"background: -o-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* Opera 11.10+ */"
+"background: -ms-linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* IE10+ */"
+"background: linear-gradient(top,  #c9e1f5 0%,#99bce8 100%); /* W3C */"
+"filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#c9e1f5', endColorstr='#99bce8',GradientType=0 ); /* IE6-9 */"
+"}"
+".GMPopSearch{margin:5px; overflow:hidden; }"
+".GMPopContent{border:1px solid #D0DBE8; background-color:#fff}"
+".GMPopUl,.GMPopUl2{list-style:none; margin:0; padding:10px;}"
+".GMPopDiv{overflow:hidden; width:100%}"
+".GMPopDiv2{overflow:hidden; width:100%}"
+".GMPopLeft,.GMPopLeft2, .GMPopLeft3 {width:220px; float:left !important; }"
+".GMPopRight,.GMPopRight2,.GMPopRight3 {width:166px; float:right !important; }"
+".GMPopUl input {margin:-2px 2px 0px 0px;padding:0 ; width:13px; height:13px; vertical-align:middle;}"
+".GMPopUl li{ padding-top:4px; padding-bottom:3px; padding-left:5px}"
+".GMPopUl2 li{ padding-top:4px; padding-bottom:3px;}"
+".GMBtnArea {margin-top:10px; text-align:center }"
+".GMPopLeft, .GMPopRight{ height:120px}"
+".GMPopLeft2, .GMPopRight2{ height:120px}"
+".GMPopLabel{line-height:12px; margin:0 0 0 2px}"
+".GMPopSubtitle{font-weight:bold; color:#000; border-bottom:1px solid  #E0E0E0; background-color:#E7E7E7;padding-left:4px;}"
+".GMPopBtn {text-align: center;text-decoration: none;color:#fff;position: relative;border:1px solid #316290;"
+"          font-size:12px; width:50px !important; height:22px !important; cursor:pointer;}"
+".GMPopBtn2 {text-align: center;text-decoration: none;color:#fff;position: relative;border:1px solid #316290;"
+"          font-size:12px; height:22px !important; cursor:pointer;}"
+".GMPopBtn, .GMPopBtn:hover {color:#fff;}"
+".GMPopBtnBlue {"
+"    background: #5689b9; /* Old browsers */"
+"    background: -moz-linear-gradient(top,  #5689b9 0%, #3a6ea0 100%); /* FF3.6+ */"
+"    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#5689b9), color-stop(100%,#3a6ea0)); /* Chrome,Safari4+ */"
+"    background: -webkit-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* Chrome10+,Safari5.1+ */"
+"    background: -o-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* Opera 11.10+ */"
+"    background: -ms-linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* IE10+ */"
+"    background: linear-gradient(top,  #5689b9 0%,#3a6ea0 100%); /* W3C */"
+"    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#5689b9', endColorstr='#3a6ea0',GradientType=0 ); /* IE6-9 */"
+"}"
+".GMPopBtnBlue:hover {"
+"    background: #3a6ea0; /* Old browsers */"
+"    background: -moz-linear-gradient(top,  #3a6ea0 0%, #5689b9 100%); /* FF3.6+ */"
+"    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#3a6ea0), color-stop(100%,#5689b9)); /* Chrome,Safari4+ */"
+"    background: -webkit-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* Chrome10+,Safari5.1+ */"
+"    background: -o-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* Opera 11.10+ */"
+"    background: -ms-linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* IE10+ */"
+"    background: linear-gradient(top,  #3a6ea0 0%,#5689b9 100%); /* W3C */"
+"    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3a6ea0', endColorstr='#5689b9',GradientType=0 ); /* IE6-9 */"
+"}"
+""
+".GMPopDisc {margin:0px 8px 8px 8px; background-color:#ebf2f5; border:1px solid #D0DBE8;}"
+".GMPopDisc ul {padding:0px; margin-left:0; margin-top:10px; margin-bottom:0;}"
+".GMPopDisc li {list-style:none; background:url(bullet.gif) no-repeat 5px 3px; margin-bottom:8px; padding-left:13px; color:#426b8c; word-break:break-all;}"
+""
+".GMPopChkArea {margin:8px; height:25px;}"
+".GMPopChkArea ul {margin:0; padding:0; float:right!important; background-color:#ebf2f5; border:1px solid #D0DBE8;}"
+".GMPopChkArea li {float:left!important; padding:3px 5px 0px 5px; list-style:none; color:#426b8c; font-weight:bold;}"
+""
+".GMPopFilter {width:250px;}"
+".GMPopHelp0, .GMPopHelp1, .GMPopClose {"
+"	cursor:pointer;"
+"	margin-top:4px;padding-right:3px;float:right!important;height:20px;"
+"	border: 0px none; background-repeat: no-repeat; padding-left: 12px; background-image: url(filter_btn.gif);"
+"}"
+".GMPopHelp0 { background-position:0px 0px; }"
+".GMPopHelp1 { background-position:-23px 0px; }"
+".GMPopClose { background-position:-46px 0px; }"
+""
+"/* Paging Icon */"
+".GMToolPagerFirst, .GMToolPagerFirst1, .GMToolPagerPrev, .GMToolPagerPrev1, .GMToolPagerNext, .GMToolPagerNext1, .GMToolPagerLast, .GMToolPagerLast1 {"
+"	border: 0px none; background-repeat: no-repeat; padding-left: 16px; padding-right: 3px; background-image: url(pager.gif);"
+"}"
+""
+".GMToolPagerFirst1 { background-position:0px 0px; }"
+".GMToolPagerFirst { background-position:-30px 0px; }"
+".GMToolPagerPrev1 { background-position:-120px 0px; }"
+".GMToolPagerPrev { background-position:-150px 0px; }"
+".GMToolPagerNext1 { background-position:-180px 0px; }"
+".GMToolPagerNext { background-position:-210px 0px; }"
+".GMToolPagerLast1 { background-position:-300px 0px; }"
+".GMToolPagerLast { background-position:-330px 0px; }"
+""
+".GMToolExpand1, .GMToolCollapse1 {"
+"	border: 0px none; background-repeat: no-repeat; padding-left: 16px; padding-right: 3px; background-image: url(group.gif);"
+"}"
+""
+".GMToolExpand1 { background-position:4px 3px; }"
+".GMToolCollapse1 { background-position:-21px 3px; }"
+""
+".GMScrollInfo {"
+"    background:#E8E8E8; padding: 8px; border: 1px solid #C8C8C8; z-index:300; box-shadow: 3px 3px 3px #888888;    "
+"}";
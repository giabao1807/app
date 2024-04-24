
import 'dart:convert';

class InputServiceBody {
    String cltVersion;
    int clientSeq;
    String secCode;
    String workerName;
    String serviceName;
    int timeOut;
    String mwLoginId;
    String mwLoginPswd;
    String appLoginId;
    String appLoginPswd;
    String clientSentTime;
    String lang;
    String mdmTp;
    List<String> inVal;
    int totInVal;
    String aprStat;
    String operation;
    String custMgnBrch;
    String custMgnAgc;
    String brkMgnBrch;
    String brkMgnAgc;
    String loginBrch;
    String loginAgnc;
    String aprSeq;
    String makerDt;
    String aprIp;
    String aprId;
    String aprAmt;
    String ipPrivate;
    String otp;
    String acntNo;
    String subNo;
    String bankCd;
    String pcName;
    String sessionId;

    InputServiceBody({
        required this.cltVersion,
        required this.clientSeq,
        required this.secCode,
        required this.workerName,
        required this.serviceName,
        required this.timeOut,
        required this.mwLoginId,
        required this.mwLoginPswd,
        required this.appLoginId,
        required this.appLoginPswd,
        required this.clientSentTime,
        required this.lang,
        required this.mdmTp,
        required this.inVal,
        required this.totInVal,
        required this.aprStat,
        required this.operation,
        required this.custMgnBrch,
        required this.custMgnAgc,
        required this.brkMgnBrch,
        required this.brkMgnAgc,
        required this.loginBrch,
        required this.loginAgnc,
        required this.aprSeq,
        required this.makerDt,
        required this.aprIp,
        required this.aprId,
        required this.aprAmt,
        required this.ipPrivate,
        required this.otp,
        required this.acntNo,
        required this.subNo,
        required this.bankCd,
        required this.pcName,
        required this.sessionId,
    });

    factory InputServiceBody.fromRawJson(String str) => InputServiceBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InputServiceBody.fromJson(Map<String, dynamic> json) => InputServiceBody(
        cltVersion: json["CltVersion"],
        clientSeq: json["ClientSeq"],
        secCode: json["SecCode"],
        workerName: json["WorkerName"],
        serviceName: json["ServiceName"],
        timeOut: json["TimeOut"],
        mwLoginId: json["MWLoginID"],
        mwLoginPswd: json["MWLoginPswd"],
        appLoginId: json["AppLoginID"],
        appLoginPswd: json["AppLoginPswd"],
        clientSentTime: json["ClientSentTime"],
        lang: json["Lang"],
        mdmTp: json["MdmTp"],
        inVal: List<String>.from(json["InVal"].map((x) => x)),
        totInVal: json["TotInVal"],
        aprStat: json["AprStat"],
        operation: json["Operation"],
        custMgnBrch: json["CustMgnBrch"],
        custMgnAgc: json["CustMgnAgc"],
        brkMgnBrch: json["BrkMgnBrch"],
        brkMgnAgc: json["BrkMgnAgc"],
        loginBrch: json["LoginBrch"],
        loginAgnc: json["LoginAgnc"],
        aprSeq: json["AprSeq"],
        makerDt: json["MakerDt"],
        aprIp: json["AprIP"],
        aprId: json["AprID"],
        aprAmt: json["AprAmt"],
        ipPrivate: json["IPPrivate"],
        otp: json["Otp"],
        acntNo: json["AcntNo"],
        subNo: json["SubNo"],
        bankCd: json["BankCd"],
        pcName: json["PCName"],
        sessionId: json["SessionID"],
    );

    Map<String, dynamic> toJson() => {
        "CltVersion": cltVersion,
        "ClientSeq": clientSeq,
        "SecCode": secCode,
        "WorkerName": workerName,
        "ServiceName": serviceName,
        "TimeOut": timeOut,
        "MWLoginID": mwLoginId,
        "MWLoginPswd": mwLoginPswd,
        "AppLoginID": appLoginId,
        "AppLoginPswd": appLoginPswd,
        "ClientSentTime": clientSentTime,
        "Lang": lang,
        "MdmTp": mdmTp,
        "InVal": List<dynamic>.from(inVal.map((x) => x)),
        "TotInVal": totInVal,
        "AprStat": aprStat,
        "Operation": operation,
        "CustMgnBrch": custMgnBrch,
        "CustMgnAgc": custMgnAgc,
        "BrkMgnBrch": brkMgnBrch,
        "BrkMgnAgc": brkMgnAgc,
        "LoginBrch": loginBrch,
        "LoginAgnc": loginAgnc,
        "AprSeq": aprSeq,
        "MakerDt": makerDt,
        "AprIP": aprIp,
        "AprID": aprId,
        "AprAmt": aprAmt,
        "IPPrivate": ipPrivate,
        "Otp": otp,
        "AcntNo": acntNo,
        "SubNo": subNo,
        "BankCd": bankCd,
        "PCName": pcName,
        "SessionID": sessionId,
    };
}

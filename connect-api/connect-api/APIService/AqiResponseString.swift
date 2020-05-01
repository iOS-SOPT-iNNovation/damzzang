// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aqiResponseString = try AqiResponseString(json)

import Foundation

// MARK: - AqiResponseString
struct AqiResponseString: Codable {
    let list: [ArpltnInforInqireSVCVo]?
    let parm, arpltnInforInqireSVCVo: ArpltnInforInqireSVCVo?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case list, parm
        case arpltnInforInqireSVCVo
        case totalCount
    }
}

// MARK: AqiResponseString convenience initializers and mutators

extension AqiResponseString {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AqiResponseString.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        list: [ArpltnInforInqireSVCVo]?? = nil,
        parm: ArpltnInforInqireSVCVo?? = nil,
        arpltnInforInqireSVCVo: ArpltnInforInqireSVCVo?? = nil,
        totalCount: Int?? = nil
    ) -> AqiResponseString {
        return AqiResponseString(
            list: list ?? self.list,
            parm: parm ?? self.parm,
            arpltnInforInqireSVCVo: arpltnInforInqireSVCVo ?? self.arpltnInforInqireSVCVo,
            totalCount: totalCount ?? self.totalCount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ArpltnInforInqireSVCVo
struct ArpltnInforInqireSVCVo: Codable {
    let returnType: ReturnType?
    let coGrade, coValue, dataTerm: String?
    let dataTime: String?
    let khaiGrade, khaiValue: String?
    let mangName: MangName?
    let no2Grade, no2Value, numOfRows, o3Grade: String?
    let o3Value, pageNo, pm10Grade, pm10Grade1H: String?
    let pm10Value, pm10Value24, pm25Grade, pm25Grade1H: String?
    let pm25Value, pm25Value24, resultCode, resultMsg: String?
    let rnum: Int?
    let serviceKey: String?
    let sidoName: String?
    let so2Grade: String?
    let so2Value: String?
    let stationCode, stationName, totalCount: String?
    let ver: Ver?

    enum CodingKeys: String, CodingKey {
        case returnType
        case coGrade, coValue, dataTerm, dataTime, khaiGrade, khaiValue, mangName, no2Grade, no2Value, numOfRows, o3Grade, o3Value, pageNo, pm10Grade
        case pm10Grade1H
        case pm10Value, pm10Value24, pm25Grade
        case pm25Grade1H
        case pm25Value, pm25Value24, resultCode, resultMsg, rnum, serviceKey, sidoName, so2Grade, so2Value, stationCode, stationName, totalCount, ver
    }
}

// MARK: ArpltnInforInqireSVCVo convenience initializers and mutators

extension ArpltnInforInqireSVCVo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ArpltnInforInqireSVCVo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        returnType: ReturnType?? = nil,
        coGrade: String?? = nil,
        coValue: String?? = nil,
        dataTerm: String?? = nil,
        dataTime: String?? = nil,
        khaiGrade: String?? = nil,
        khaiValue: String?? = nil,
        mangName: MangName?? = nil,
        no2Grade: String?? = nil,
        no2Value: String?? = nil,
        numOfRows: String?? = nil,
        o3Grade: String?? = nil,
        o3Value: String?? = nil,
        pageNo: String?? = nil,
        pm10Grade: String?? = nil,
        pm10Grade1H: String?? = nil,
        pm10Value: String?? = nil,
        pm10Value24: String?? = nil,
        pm25Grade: String?? = nil,
        pm25Grade1H: String?? = nil,
        pm25Value: String?? = nil,
        pm25Value24: String?? = nil,
        resultCode: String?? = nil,
        resultMsg: String?? = nil,
        rnum: Int?? = nil,
        serviceKey: String?? = nil,
        sidoName: String?? = nil,
        so2Grade: String?? = nil,
        so2Value: String?? = nil,
        stationCode: String?? = nil,
        stationName: String?? = nil,
        totalCount: String?? = nil,
        ver: Ver?? = nil
    ) -> ArpltnInforInqireSVCVo {
        return ArpltnInforInqireSVCVo(
            returnType: returnType ?? self.returnType,
            coGrade: coGrade ?? self.coGrade,
            coValue: coValue ?? self.coValue,
            dataTerm: dataTerm ?? self.dataTerm,
            dataTime: dataTime ?? self.dataTime,
            khaiGrade: khaiGrade ?? self.khaiGrade,
            khaiValue: khaiValue ?? self.khaiValue,
            mangName: mangName ?? self.mangName,
            no2Grade: no2Grade ?? self.no2Grade,
            no2Value: no2Value ?? self.no2Value,
            numOfRows: numOfRows ?? self.numOfRows,
            o3Grade: o3Grade ?? self.o3Grade,
            o3Value: o3Value ?? self.o3Value,
            pageNo: pageNo ?? self.pageNo,
            pm10Grade: pm10Grade ?? self.pm10Grade,
            pm10Grade1H: pm10Grade1H ?? self.pm10Grade1H,
            pm10Value: pm10Value ?? self.pm10Value,
            pm10Value24: pm10Value24 ?? self.pm10Value24,
            pm25Grade: pm25Grade ?? self.pm25Grade,
            pm25Grade1H: pm25Grade1H ?? self.pm25Grade1H,
            pm25Value: pm25Value ?? self.pm25Value,
            pm25Value24: pm25Value24 ?? self.pm25Value24,
            resultCode: resultCode ?? self.resultCode,
            resultMsg: resultMsg ?? self.resultMsg,
            rnum: rnum ?? self.rnum,
            serviceKey: serviceKey ?? self.serviceKey,
            sidoName: sidoName ?? self.sidoName,
            so2Grade: so2Grade ?? self.so2Grade,
            so2Value: so2Value ?? self.so2Value,
            stationCode: stationCode ?? self.stationCode,
            stationName: stationName ?? self.stationName,
            totalCount: totalCount ?? self.totalCount,
            ver: ver ?? self.ver
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//enum DataTime: String, Codable {
//    case empty = ""
//    case the202005020300 = "2020-05-02 03:00"
//}

enum MangName: String, Codable {
    case empty = ""
    case 도로변대기 = "도로변대기"
    case 도시대기 = "도시대기"
}

enum ReturnType: String, Codable {
    case json = "json"
}

//enum SidoName: String, Codable {
//    case empty = ""
//    case 서울 = "서울"
//}

//enum So2Value: String, Codable {
//    case empty = ""
//    case the0002 = "0.002"
//    case the0003 = "0.003"
//}

enum Ver: String, Codable {
    case empty = ""
    case the13 = "1.3"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}


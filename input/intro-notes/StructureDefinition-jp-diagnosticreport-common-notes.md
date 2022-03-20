
### 用語定義

| Path | 定義 | バインディング強度 | バリューセット |
| --- | --- | --- | --- |
| `DiagnosticReport.status` | 検査レポートの状態 | Required | [`DiagnosticReportStatus`](https://www.hl7.org/fhir/valueset-diagnostic-report-status.html) |
| `DiagnosticReport.category` | 検査サービスセクションのコード | Example | [`DiagnosticServiceSectionCodes`](https://www.hl7.org/fhir/valueset-diagnostic-service-sections.html) |
| `DiagnosticReport.code` | 検査レポートを記述するコード | Preferred | [`LOINCDiagnosticReportCodes`](https://www.hl7.org/fhir/valueset-report-codes.html) |
| `DiagnosticReport.conclusionCode` | レポートの補助として提供される診断コード | Example | [`SNOMEDCTClinicalFindings`](https://www.hl7.org/fhir/valueset-clinical-findings.html) |

### Interaction一覧 <a name="DxReportInteraction">link</a>

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

## 利用方法

各ユースケースのプロファイルを参照のこと。

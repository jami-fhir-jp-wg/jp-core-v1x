
Invariant: valid-system-local-patientID
Description: "jp-core-0001:施設患者IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.51.[1+施設番号10桁]'でなければならない。"
Severity: #error
Expression: "exists(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').not() or exists(system.substring(31).matches('^1(0[1-9]|[1-3][0-9]|4[0-7])([0-9])([0-9]{7})$')).not()"

Invariant: valid-system-local-prescriptionID
Description: "jp-core-0002:施設処方箋IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.11.[1+施設番号10桁]'でなければならない。"
Severity: #error
Expression: "exists(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.11.').not() or exists(system.substring(31).matches('^1(0[1-9]|[1-3][0-9]|4[0-7])([0-9])([0-9]{7})$')).not()"

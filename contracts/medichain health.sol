// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MediChain {
    struct MedicalRecord {
        string patientId;
        string name;
        string diagnosis;
        string treatment;
        string doctor;
        uint256 timestamp;
    }

    MedicalRecord[] public records;

    event RecordAdded(uint256 index, string patientId);

    // Add a medical record
    function addRecord(
        string memory patientId,
        string memory name,
        string memory diagnosis,
        string memory treatment,
        string memory doctor
    ) public {
        MedicalRecord memory newRecord = MedicalRecord({
            patientId: patientId,
            name: name,
            diagnosis: diagnosis,
            treatment: treatment,
            doctor: doctor,
            timestamp: block.timestamp
        });

        records.push(newRecord);
        emit RecordAdded(records.length - 1, patientId);
    }

    // Get a record by index
    function getRecord(uint256 index) public view returns (
        string memory patientId,
        string memory name,
        string memory diagnosis,
        string memory treatment,
        string memory doctor,
        uint256 timestamp
    ) {
        require(index < records.length, "Record does not exist");
        MedicalRecord storage record = records[index];
        return (
            record.patientId,
            record.name,
            record.diagnosis,
            record.treatment,
            record.doctor,
            record.timestamp
        );
    }

    // Get total number of records
    function getRecordCount() public view returns (uint256) {
        return records.length;
    }
}

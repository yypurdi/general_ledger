# General Ledger
General Ledger Application Module <br />
<br />
Base Functions : <br />
1. Chart Of Account <br />
2. General Ledger <br />
3. Product <br />
4. Stock Inventory <br />
<br />
Requirement : <br />
<br />
1. Install MySQL Server and load file import.sql <br />
2. Install MQTT Broker (the default using mqtt://test.mosquitto.org) <br />
3. Change configuration in file general_ledger/routes/dao.js for MySQL DB access <br />
4. Change configuration in file general_ledger/routes/dao.js for MQTT Broker address <br />
5. Change Security Certificate in directory general_ledger/encryption (Optional) <br />
<br />
Run: <br />
<br />
  $npm install <br />
  $npm start <br />

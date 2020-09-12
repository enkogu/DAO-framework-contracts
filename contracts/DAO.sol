pragma solidity >=0.4.22 <0.8.0;


// Decentralized autonomous organisation
/*
	Пока предустановленные роли:
		Employee – все сотрудники
		Chief – все управленцы
		Owner – все, у кого есть доля компании
*/

contract DAO {
	enum Roles {
		Employee,
		Chief,
		Shareholder
	}

	uint public sharesAmount = 10**20;

	uint public shareholdersCount;
	mapping(uint => address) shareholders;
	mapping(address => uint) sharesAmountByShareholder;

	uint public employeesCount;
	mapping(uint => address) employees;
	mapping(address => uint) employeeToNum;

	uint public chiefsCount;
	mapping(uint => address) chiefs;
	mapping(address => uint) chiefToNum;

	constructor () {
		shareholdersCount += 1;
		shareholders[shareholdersCount] = msg.sender;
		sharesAmountByShareholder[msg.sender] = sharesAmount;
	}

	function addEmployee (address addr) public {
		require(chiefToNum[msg.sender] != 0);

		employeesCount += 1;
		employees[employeesCount] = addr;
	}

	function addChief (address addr) public {
		require(chiefToNum[msg.sender] != 0);

		chiefsCount += 1;
		chiefs[chiefsCount] = addr;
	}

	function sendShares (address addr, uint amount) public {
		require(sharesAmountByShareholder[msg.sender] >= amount);
		sharesAmountByShareholder[msg.sender] -= amount;

		// remove shareholder if he is not a holder anymore
		// add shareholder if he was not a holder

		sharesAmountByShareholder[addr] += amount;
		// fix shareholders amount, shareholders
		// shareholdersCount
		// shareholders[shareholdersCount] = addr;
	}

	/*

	*/
	function addProduct () {}
}
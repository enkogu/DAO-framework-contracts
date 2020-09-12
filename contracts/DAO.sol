pragma solidity >=0.4.22 <0.8.0;


/*
	Пока предустановленные роли:
		Employee – все сотрудники
		Chief – все управленцы
		Owner – все, у кого есть доля компании
*/

// Decentralized autonomous organisation
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

	// TODO: connect contract
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

	// generalization: product levels
	struct Product {
		uint id;
		string name;
		uint price;
		mapping(address => bool) owners;
	}

	uint public productsCount;
	mapping(uint => Product) products; // num to product

	function addProduct () {}
	function updateProduct () {}
	function removeProduct () {}
	function getProduct () {}

	function buy () {}


	// generalization: service levels (basic, pro, etc)
	struct Service {
		uint id;
		string name;
		uint price;
		uint period;
		mapping(address => uint) expireDates;
	}

	uint public servicesCount;
	mapping(uint => Service) services; // num to product


	function addService () {}
	function updateService () {}
	function removeService () {}
	function getService () {}

	function subscribe () {}
}
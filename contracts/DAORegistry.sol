pragma solidity >=0.4.22 <0.8.0;

contract DAORegistry {
	uint public regCount = 0;
	mapping(string => address) reg;

	address admin public;

	constructor () {
		admin = msg.sender;
	}

	function setAdmin () public {
		require(msg.sender == admin);
		admin = msg.sender;
	}

	function addDAO(string name, address addr) public {
		require(msg.sender == admin);

		regCount += 1;
		reg[name] = addr;
	}

	function getDAO(string name) public view returns(address addr) {
		return reg[name];
	}
}
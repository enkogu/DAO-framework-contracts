pragma solidity >=0.4.22 <0.8.0;

// Dispute resolution system
contract DRS {
	enum AgreementState {
		Init,
		Completed,
		Reversed
	}

	struct Agreement {
		address sideA;
		address sideB;
		address arbitrator;
		uint depositAmount;

		string body;
		AgreementState state;
	}

	mapping(uint => Agreement) agreements;

	address admin public;
	uint comission = 10**17; // 0.1 ETH

	constructor () {
		admin = msg.sender;
	}

	function setAdmin () public {
		require(msg.sender == admin);
		admin = msg.sender;
	}


	/*
	createAgreement(address sideA, address sideB, address arbitrator, uint depositAmount, string body)
		require(msg.amount == comission + depositAmount);

	getAgreement
	setAgreementState(bool isCompleted)

	*/
}
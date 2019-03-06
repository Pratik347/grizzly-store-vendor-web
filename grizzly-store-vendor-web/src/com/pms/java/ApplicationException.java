package com.pms.java;

public class ApplicationException extends Exception {
	int errorCode;
	String errorMessage;

	public ApplicationException(int errorCode, String errorMessage) {
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return (errorCode + ":" + errorMessage);
	}

}

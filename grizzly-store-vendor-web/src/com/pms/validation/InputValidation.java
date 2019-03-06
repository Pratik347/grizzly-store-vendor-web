package com.pms.validation;

public class InputValidation
{
	public static boolean checkForInteger(String string)
	{
		boolean flag = false;
		for (int i = 0; i < string.length(); i++) {
			if ((int) string.charAt(i) <= 57 && (int) string.charAt(i) >= 48) {
				flag = true;
			} else {
				flag = false;
				break;
			}
		}
		return flag;
	}
	
	public static boolean checkForDecimal(String string)
	{
		boolean flag = false;
		for (int i = 0; i < string.length(); i++) {
			if ((int) string.charAt(i) <= 57 && (int) string.charAt(i) >= 48 || (int) string.charAt(i)==46) {
				flag = true;
			} else {
				flag = false;
				break;
			}
		}
		return flag;
	}

}



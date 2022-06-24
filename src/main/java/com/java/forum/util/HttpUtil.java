package com.java.forum.util;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {

	private String value;

	public HttpUtil(String value) {
		this.value = value;
	}

	/**
	 * convert json to model
	 */
	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);  // chuyển json - chuỗi
		} catch (Exception e) {
		}
		return null;
	}

	public static HttpUtil of(BufferedReader reader) {
		StringBuffer sBuffer = new StringBuffer();
		try {
			String line;
			while ((line = reader.readLine()) != null) {
				sBuffer.append(line);
			}
		} catch (IOException e) {
		}

		return new HttpUtil(sBuffer.toString());
	}
}

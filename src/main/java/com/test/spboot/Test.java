package com.test.spboot;

interface Action{
	public void test();
}
public class Test {

	public static void main(String[] args) {
		Action a = new Action() {
			@Override
			public void test() {
			}
		};
	}
}

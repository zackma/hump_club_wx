package com.hump.util;

public class PerformanceTest implements Runnable {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread t = new Thread(new PerformanceTest());
		
		long stime = (long) System.nanoTime();
		t.run();
		long ftime = (long) System.nanoTime();
		System.out.println("总共耗时："+(ftime-stime)+"纳秒");
		System.out.println("总共耗时："+(ftime-stime)/ 1000000+"毫秒");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("llallalal");
	}

}

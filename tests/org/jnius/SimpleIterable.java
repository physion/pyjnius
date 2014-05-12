package org.jnius;

import java.util.*;

public class SimpleIterable {
	public Iterable<String> getIterable() {
        List<String> result = new ArrayList<String>();
        result.add("hello");
        result.add("world");
        
        return result;
	}
}

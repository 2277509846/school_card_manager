package com.fjp.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetPageUtil {
    public static <T> Map<String, Object> getPage(List<T> list, Integer page, Integer count) {
        if (page == null) page = 1;
        count = 13;
        int total = (list.size() - 1) / count + 1;
        if (page > total) page = total;
        if (page < 1) page = 1;
        int from = (page - 1) * count;
        int to = from + count;
        if (to > list.size()) {
            to = list.size();
            count = to - from;
        }
        list = list.subList(from, to);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("count", count);
        map.put("currentPage", page);
        map.put("list", list);
        return map;
    }
}

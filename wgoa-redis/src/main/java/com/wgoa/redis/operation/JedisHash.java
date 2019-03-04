package com.wgoa.redis.operation;

import com.wgoa.redis.utils.JedisUtil;
import com.wgoa.redis.utils.JedisVO;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 对存储结构为HashMap类型的操作
 * @Author Arno
 * @Date 2019/1/25 10:59
 * @Version 1.0
 **/
public class JedisHash extends JedisKeys {

    public JedisHash(JedisVO jedisVO){
        instance(jedisVO);
    }

    /**
     * 从hash中删除指定的存储
     * @param key
     * @param fieid 存储的名字
     * @return 状态码，1成功，0失败
     * */
    public long hdel(String key, String fieid) {
        Jedis jedis = getJedis();
        long s = jedis.hdel(key, fieid);
        returnJedis(jedis);
        return s;
    }

    public long hdel(String key) {
        Jedis jedis = getJedis();
        long s = jedis.del(key);
        returnJedis(jedis);
        return s;
    }

    /**
     * 测试hash中指定的存储是否存在
     * @param key
     * @param fieid 存储的名字
     * @return 1存在，0不存在
     * */
    public boolean hexists(String key, String fieid) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        boolean s = sjedis.hexists(key, fieid);
        returnJedis(sjedis);
        return s;
    }

    /**
     * 返回hash中指定存储位置的值
     *
     * @param key
     * @param fieid 存储的名字
     * @return 存储对应的值
     * */
    public String hget(String key, String fieid) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        String s = sjedis.hget(key, fieid);
        returnJedis(sjedis);
        return s;
    }

    public byte[] hget(byte[] key, byte[] fieid) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        byte[] s = sjedis.hget(key, fieid);
        returnJedis(sjedis);
        return s;
    }

    /**
     * 以Map的形式返回hash中的存储和值
     * @param key
     * @return Map<Strinig,String>
     * */
    public Map<String, String> hgetAll(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        Map<String, String> map = sjedis.hgetAll(key);
        returnJedis(sjedis);
        return map;
    }

    /**
     * 添加一个对应关系
     * @param key
     * @param fieid
     * @param value
     * @return 状态码 1成功，0失败，fieid已存在将更新，也返回0
     * **/
    public long hset(String key, String fieid, String value) {
        Jedis jedis = getJedis();
        long s = jedis.hset(key, fieid, value);
        returnJedis(jedis);
        return s;
    }

    public long hset(String key, String fieid, byte[] value) {
        Jedis jedis = getJedis();
        long s = jedis.hset(key.getBytes(), fieid.getBytes(), value);
        returnJedis(jedis);
        return s;
    }

    /**
     * 添加对应关系，只有在fieid不存在时才执行
     * @param key
     * @param fieid
     * @param value
     * @return 状态码 1成功，0失败fieid已存
     * **/
    public long hsetnx(String key, String fieid, String value) {
        Jedis jedis = getJedis();
        long s = jedis.hsetnx(key, fieid, value);
        returnJedis(jedis);
        return s;
    }

    /**
     * 获取hash中value的集合
     *
     * @param
     *            key
     * @return List<String>
     * */
    public List<String> hvals(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        List<String> list = sjedis.hvals(key);
        returnJedis(sjedis);
        return list;
    }

    /**
     * 在指定的存储位置加上指定的数字，存储位置的值必须可转为数字类型
     * @param  key
     * @param  fieid 存储位置
     * @param value 要增加的值,可以是负数
     * @return 增加指定数字后，存储位置的值
     * */
    public long hincrby(String key, String fieid, long value) {
        Jedis jedis = getJedis();
        long s = jedis.hincrBy(key, fieid, value);
        returnJedis(jedis);
        return s;
    }

    /**
     * 返回指定hash中的所有存储名字,类似Map中的keySet方法
     * @param key
     * @return Set<String> 存储名称的集合
     * */
    public Set<String> hkeys(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        Set<String> set = sjedis.hkeys(key);
        returnJedis(sjedis);
        return set;
    }

    /**
     * 获取hash中存储的个数，类似Map中size方法
     * @param key
     * @return long 存储的个数
     * */
    public long hlen(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        long len = sjedis.hlen(key);
        returnJedis(sjedis);
        return len;
    }

    /**
     * 根据多个key，获取对应的value，返回List,如果指定的key不存在,List对应位置为null
     * @param key
     * @param fieids 存储位置
     * @return List<String>
     * */
    public List<String> hmget(String key, String... fieids) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        List<String> list = sjedis.hmget(key, fieids);
        returnJedis(sjedis);
        return list;
    }

    public List<byte[]> hmget(byte[] key, byte[]... fieids) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        List<byte[]> list = sjedis.hmget(key, fieids);
        returnJedis(sjedis);
        return list;
    }

    /**
     * 添加对应关系，如果对应关系已存在，则覆盖
     * @param key
     * @param map 对应关系
     * @return 状态，成功返回OK
     * */
    public String hmset(String key, Map<String, String> map) {
        Jedis jedis = getJedis();
        String s = jedis.hmset(key, map);
        returnJedis(jedis);
        return s;
    }

    /**
     * 添加对应关系，如果对应关系已存在，则覆盖
     * @param key
     * @param map 对应关系
     * @return 状态，成功返回OK
     * */
    public String hmset(byte[] key, Map<byte[], byte[]> map) {
        Jedis jedis = getJedis();
        String s = jedis.hmset(key, map);
        returnJedis(jedis);
        return s;
    }

}

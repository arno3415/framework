package com.wgoa.redis.operation;

import com.wgoa.redis.utils.JedisVO;
import redis.clients.jedis.Jedis;
import redis.clients.util.SafeEncoder;

import java.util.List;

/**
 * 对存储结构为String类型的操作
 * @Author Arno
 * @Date 2019/1/25 11:07
 * @Version 1.0
 **/
public class JedisStrings extends JedisKeys {

    public JedisStrings(JedisVO jedisVO){
        instance(jedisVO);
    }

    /**
     * 根据key获取记录
     * @param  key
     * @return 值
     * */
    public String get(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        String value = sjedis.get(key);
        returnJedis(sjedis);
        return value;
    }

    /**
     * 根据key获取记录
     * @param key
     * @return 值
     * */
    public byte[] get(byte[] key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        byte[] value = sjedis.get(key);
        returnJedis(sjedis);
        return value;
    }

    /**
     * 添加有过期时间的记录
     *
     * @param key
     * @param seconds 过期时间，以秒为单位
     * @param value
     * @return String 操作状态
     * */
    public String setEx(String key, int seconds, String value) {
        Jedis jedis = getJedis();
        String str = jedis.setex(key, seconds, value);
        returnJedis(jedis);
        return str;
    }

    /**
     * 添加有过期时间的记录
     *
     * @param key
     * @param seconds 过期时间，以秒为单位
     * @param value
     * @return String 操作状态
     * */
    public String setEx(byte[] key, int seconds, byte[] value) {
        Jedis jedis = getJedis();
        String str = jedis.setex(key, seconds, value);
        returnJedis(jedis);
        return str;
    }

    /**
     * 添加一条记录，仅当给定的key不存在时才插入
     * @param key
     * @param value
     * @return long 状态码，1插入成功且key不存在，0未插入，key存在
     * */
    public long setnx(String key, String value) {
        Jedis jedis = getJedis();
        long str = jedis.setnx(key, value);
        returnJedis(jedis);
        return str;
    }

    /**
     * 添加记录,如果记录已存在将覆盖原有的value
     * @param key
     * @param value
     * @return 状态码
     * */
    public String set(String key, String value) {
        return set(SafeEncoder.encode(key), SafeEncoder.encode(value));
    }

    /**
     * 添加记录,如果记录已存在将覆盖原有的value
     * @param key
     * @param value
     * @return 状态码
     * */
    public String set(String key, byte[] value) {
        return set(SafeEncoder.encode(key), value);
    }

    /**
     * 添加记录,如果记录已存在将覆盖原有的value
     * @param key
     * @param value
     * @return 状态码
     * */
    public String set(byte[] key, byte[] value) {
        Jedis jedis = getJedis();
        String status = jedis.set(key, value);
        returnJedis(jedis);
        return status;
    }

    /**
     * 从指定位置开始插入数据，插入的数据会覆盖指定位置以后的数据<br/>
     * 例:String str1="123456789";<br/>
     * 对str1操作后setRange(key,4,0000)，str1="123400009";
     * @param key
     * @param offset
     * @param value
     * @return long value的长度
     * */
    public long setRange(String key, long offset, String value) {
        Jedis jedis = getJedis();
        long len = jedis.setrange(key, offset, value);
        returnJedis(jedis);
        return len;
    }

    /**
     * 在指定的key中追加value
     * @param key
     * @param value
     * @return long 追加后value的长度
     * **/
    public long append(String key, String value) {
        Jedis jedis = getJedis();
        long len = jedis.append(key, value);
        returnJedis(jedis);
        return len;
    }

    /**
     * 将key对应的value减去指定的值，只有value可以转为数字时该方法才可用
     * @param key
     * @param number 要减去的值
     * @return long 减指定值后的值
     * */
    public long decrBy(String key, long number) {
        Jedis jedis = getJedis();
        long len = jedis.decrBy(key, number);
        returnJedis(jedis);
        return len;
    }

    /**
     * <b>可以作为获取唯一id的方法</b><br/>
     * 将key对应的value加上指定的值，只有value可以转为数字时该方法才可用
     * @param  key
     * @param number 要减去的值
     * @return long 相加后的值
     * */
    public long incrBy(String key, long number) {
        Jedis jedis = getJedis();
        long len = jedis.incrBy(key, number);
        returnJedis(jedis);
        return len;
    }

    /**
     * 对指定key对应的value进行截取
     * @param key
     * @param startOffset 开始位置(包含)
     * @param endOffset 结束位置(包含)
     * @return String 截取的值
     * */
    public String getrange(String key, long startOffset, long endOffset) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis = getJedis();
        String value = sjedis.getrange(key, startOffset, endOffset);
        returnJedis(sjedis);
        return value;
    }

    /**
     * 获取并设置指定key对应的value<br/>
     * 如果key存在返回之前的value,否则返回null
     * @param key
     * @param value
     * @return String 原始value或null
     * */
    public String getSet(String key, String value) {
        Jedis jedis = getJedis();
        String str = jedis.getSet(key, value);
        returnJedis(jedis);
        return str;
    }

    /**
     * 批量获取记录,如果指定的key不存在返回List的对应位置将是null
     * @param keys
     * @return List<String> 值得集合
     * */
    public List<String> mget(String... keys) {
        Jedis jedis = getJedis();
        List<String> str = jedis.mget(keys);
        returnJedis(jedis);
        return str;
    }

    /**
     * 批量存储记录
     * @param keysvalues 例:keysvalues="key1","value1","key2","value2";
     * @return String 状态码
     * */
    public String mset(String... keysvalues) {
        Jedis jedis = getJedis();
        String str = jedis.mset(keysvalues);
        returnJedis(jedis);
        return str;
    }

    /**
     * 获取key对应的值的长度
     * @param key
     * @return value值得长度
     * */
    public long strlen(String key) {
        Jedis jedis = getJedis();
        long len = jedis.strlen(key);
        returnJedis(jedis);
        return len;
    }
}

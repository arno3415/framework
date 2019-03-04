package com.wgoa.redis.operation;

import com.wgoa.redis.utils.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.SortingParams;
import redis.clients.util.SafeEncoder;

import java.util.List;
import java.util.Set;

/**
 * 操作Key的方法
 * @Author Arno
 * @Date 2019/1/25 9:51
 * @Version 1.0
 **/
public class JedisKeys extends JedisUtil {

    /**
     * 清空所有key
     */
    public String flushAll() {
        Jedis jedis = getJedis();
        String stata = jedis.flushAll();
        returnJedis(jedis);
        return stata;
    }

    /**
     * 更改key
     * @param oldkey
     * @param  newkey
     * @return 状态码
     * */
    public String rename(String oldkey, String newkey) {
        return rename(SafeEncoder.encode(oldkey),
                SafeEncoder.encode(newkey));
    }

    /**
     * 更改key,仅当新key不存在时才执行
     * @param oldkey
     * @param newkey
     * @return 状态码
     * */
    public long renamenx(String oldkey, String newkey) {
        Jedis jedis = getJedis();
        long status = jedis.renamenx(oldkey, newkey);
        returnJedis(jedis);
        return status;
    }

    /**
     * 更改key
     * @param oldkey
     * @param newkey
     * @return 状态码
     * */
    public String rename(byte[] oldkey, byte[] newkey) {
        Jedis jedis = getJedis();
        String status = jedis.rename(oldkey, newkey);
        returnJedis(jedis);
        return status;
    }

    /**
     * 设置key的过期时间，以秒为单位
     * @param key
     * @param seconds
     * @return 影响的记录数
     * */
    public long expired(String key, int seconds) {
        Jedis jedis = getJedis();
        long count = jedis.expire(key, seconds);
        returnJedis(jedis);
        return count;
    }

    /**
     * 设置key的过期时间,它是距历元（即格林威治标准时间 1970 年 1 月 1 日的 00:00:00，格里高利历）的偏移量。
     * @param  key
     * @param timestamp
     * @return 影响的记录数
     * */
    public long expireAt(String key, long timestamp) {
        Jedis jedis = getJedis();
        long count = jedis.expireAt(key, timestamp);
        returnJedis(jedis);
        return count;
    }

    /**
     * 查询key的过期时间
     * @param key
     * @return 以秒为单位的时间表示
     * */
    public long ttl(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis=getJedis();
        long len = sjedis.ttl(key);
        returnJedis(sjedis);
        return len;
    }

    /**
     * 取消对key过期时间的设置
     * @param key
     * @return 影响的记录数
     * */
    public long persist(String key) {
        Jedis jedis = getJedis();
        long count = jedis.persist(key);
        returnJedis(jedis);
        return count;
    }

    /**
     * 删除keys对应的记录,可以是多个key
     * @param   keys
     * @return 删除的记录数
     * */
    public long del(String... keys) {
        Jedis jedis = getJedis();
        long count = jedis.del(keys);
        returnJedis(jedis);
        return count;
    }

    /**
     * 删除keys对应的记录,可以是多个key
     * @param keys
     * @return 删除的记录数
     * */
    public long del(byte[]... keys) {
        Jedis jedis = getJedis();
        long count = jedis.del(keys);
        returnJedis(jedis);
        return count;
    }

    /**
     * 判断key是否存在
     * @param key
     * @return boolean
     * */
    public boolean exists(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis=getJedis();
        boolean exis = sjedis.exists(key);
        returnJedis(sjedis);
        return exis;
    }

    /**
     * 对List,Set,SortSet进行排序,如果集合数据较大应避免使用这个方法
     * @param key
     * @return List<String> 集合的全部记录
     * **/
    public List<String> sort(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis=getJedis();
        List<String> list = sjedis.sort(key);
        returnJedis(sjedis);
        return list;
    }

    /**
     * 对List,Set,SortSet进行排序或limit
     * @param key
     * @param parame 定义排序类型或limit的起止位置.
     * @return List<String> 全部或部分记录
     * **/
    public List<String> sort(String key, SortingParams parame) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis=getJedis();
        List<String> list = sjedis.sort(key, parame);
        returnJedis(sjedis);
        return list;
    }

    /**
     * 返回指定key存储的类型
     * @param key
     * @return String string|list|set|zset|hash
     * **/
    public String type(String key) {
        //ShardedJedis sjedis = getShardedJedis();
        Jedis sjedis=getJedis();
        String type = sjedis.type(key);
        returnJedis(sjedis);
        return type;
    }

    /**
     * 查找所有匹配给定的模式的键
     * @param  *表示多个，？表示一个
     * */
    public Set<String> keys(String pattern) {
        Jedis jedis = getJedis();
        Set<String> set = jedis.keys(pattern);
        returnJedis(jedis);
        return set;
    }
}

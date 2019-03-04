package com.wgoa.redis.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * jedis工具类
 * @Author Arno
 * @Date 2018/12/11 14:18
 * @Version 1.0
 **/
public class JedisUtil {

    /**缓存生存时间 */
    private final int expire = 600;
    volatile private static JedisPool jedisPool = null;

    /**
     * 获取JedisUtil实例
     * 单例模式线程安全
     * @return
     */
    protected JedisUtil instance(JedisVO jedisVO) {
        try {
            if(jedisPool != null){//懒汉式

            }else{
                //创建实例之前可能会有一些准备性的耗时工作
                Thread.sleep(300);
                synchronized (JedisUtil.class) {
                    jedisPool = new JedisPool(new JedisPoolConfig(),jedisVO.getJedisHost(), jedisVO.getJedisPort(), 10000,jedisVO.getJedisPassword());
                }
            }
        } catch (InterruptedException e){
            e.printStackTrace();
        }
        return this;
    }

    protected JedisPool getPool() {
        return jedisPool;
    }

    /**
     * 从jedis连接池中获取获取jedis对象
     * @return
     */
    protected Jedis getJedis() {
        return jedisPool.getResource();
    }

    /**
     * 回收jedis
     * @param jedis
     */
    protected void returnJedis(Jedis jedis) {
        jedisPool.returnResource(jedis);
    }

    /**
     * 设置过期时间
     * @author ruan 2013-4-11
     * @param key
     * @param seconds
     */
    protected void expire(String key, int seconds) {
        if (seconds <= 0) {
            return;
        }
        Jedis jedis = getJedis();
        jedis.expire(key, seconds);
        returnJedis(jedis);
    }

    /**
     * 设置默认过期时间
     * @author ruan 2013-4-11
     * @param key
     */
    protected void expire(String key) {
        expire(key, expire);
    }

}

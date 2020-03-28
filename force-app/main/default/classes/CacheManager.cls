/**
 * @File Name          : CacheManager.cls
 * @Description        : Entry point for interacting with various caching mechanisms
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/28/2020, 12:20:01 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/27/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CacheManager {
    
    @TestVisible
    private DatabaseConnection conn;
    @TestVisible
    private static Map<String, ICache> caches;

    public CacheManager(DatabaseConnection conn) {
        this.conn = conn;
    }

    public Object get(String cacheName, String key) {
        ICache cache = this.loadCache(cacheName);
        return cache.get(key);
    }

    public void set(String cacheName, String key, Object value) {
        ICache cache = this.loadCache(cacheName);
        cache.put(key, value);
    }

    private ICache loadCache(String cacheName) {
        if (caches == null) {
            caches = new Map<String, ICache>();
            List<CacheSetting__mdt> settings = (List<CacheSetting__mdt>)this.conn.query(new CacheQueryOptionsBuilder(cacheName));
            for (CacheSetting__mdt setting : settings) {
                caches.put(setting.DeveloperName.toLowerCase(), (ICache)Type.forName(setting.ClassName__c).newInstance());
            }
        }
        String cacheNameLower = cacheName.toLowerCase();
        if (!caches.containsKey(cacheNameLower)) throw new CacheException('TODO');
        return caches.get(cacheNameLower);
    }
}

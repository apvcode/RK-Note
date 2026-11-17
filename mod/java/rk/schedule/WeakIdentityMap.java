package rk.schedule;

import java.lang.ref.*;
import java.util.*;

/** Model equality omits original occurrence identity; use weak object identity instead. */
public final class WeakIdentityMap<K,V> {
    private final ReferenceQueue<K> queue=new ReferenceQueue<>();
    private final Map<Ref<K>,V> values=new HashMap<>();
    private static final class Ref<K> extends WeakReference<K> {
        final int hash;
        Ref(K value,ReferenceQueue<K> queue){super(value,queue);hash=System.identityHashCode(value);}
        public int hashCode(){return hash;}
        public boolean equals(Object value){if(this==value)return true;if(!(value instanceof Ref))return false;Object key=get();return key!=null&&key==((Ref<?>)value).get();}
    }
    private void prune(){Reference<? extends K> ref;while((ref=queue.poll())!=null)values.remove(ref);}
    public synchronized void put(K key,V value){prune();values.put(new Ref<>(key,queue),value);}
    public synchronized V get(K key){prune();return values.get(new Ref<>(key,null));}
    public synchronized void clear(){values.clear();while(queue.poll()!=null){}}
}

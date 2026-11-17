import java.io.File;
import com.android.tools.smali.baksmali.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
public final class Disassemble {
    public static void main(String[] args)throws Exception {
        MultiDexContainer<?> container=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.forApi(21));
        for(String name:container.getDexEntryNames())if(!Baksmali.disassembleDexFile(container.getEntry(name).getDexFile(),new File(args[1]),2,new BaksmaliOptions()))throw new IllegalStateException("Disassembly failed");
    }
}

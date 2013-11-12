package othertest;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;

import com.bm.gjb5.model.RightsResource;

public class CollectionUtilsTest {
	@SuppressWarnings("all")
	public static void main(String[] args) {
		 RightsResource[] arrayA = new RightsResource[] {new RightsResource(0),new RightsResource(1),new RightsResource(2),new RightsResource(3)};
		 RightsResource[] arrayB = new RightsResource[] {new RightsResource(0),new RightsResource(1) };
		  List<RightsResource> a = Arrays.asList(arrayA);
		  List<RightsResource> b = Arrays.asList(arrayB);
		  //并集
		  Collection<RightsResource> union = CollectionUtils.union(a, b);
		  //交集
		  Collection<RightsResource> intersection = CollectionUtils.intersection(a, b);
		  //交集的补集
		  Collection<RightsResource> disjunction = CollectionUtils.disjunction(a, b);
		  //集合相减
		  Collection<RightsResource> subtract = CollectionUtils.subtract(b,a);


//		  System.out.println("A: " + ArrayUtils.toString(a.toArray()));
//		  System.out.println("B: " + ArrayUtils.toString(b.toArray()));
		  System.out.println("--------------------------------------------");
//		  System.out.println("Union(A, B): " + ArrayUtils.toString(union.toArray()));
		  System.out.println("Intersection(A, B): " + ArrayUtils.toString(intersection.toArray()));
//		  System.out.println("Disjunction(A, B): " + ArrayUtils.toString(disjunction.toArray()));
		  System.out.println("Subtract(A, B): " + ArrayUtils.toString(subtract.toArray()));
//		  Map<String, String> map = new HashMap<String, String>();
//		  map.put("info","hello");
//		  System.out.println(JSONObject.fromObject(map).toString());
	}
	
}

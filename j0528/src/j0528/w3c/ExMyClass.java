package j0528.w3c;

public class ExMyClass {

	public static void main(String[] args) {
		var originOne = new MyPoint();
		originOne.myStr();
	// ===== Students 클래스 만들기 =====
	// ===== st01, st02, st03 오브젝트를 만들자.
	
	var st01 = new Students();
	var st02 = new Students();
	var st03 = new Students();
	
	st01.setName("lsj");
	st01.setData(27, true);
	System.out.println(st01.getName());
	
	st01.callData();
	
	}
}

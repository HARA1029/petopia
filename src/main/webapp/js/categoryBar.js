function category(cateno,id) {
	  switch (cateno) {
	    case '0':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=0&id='+id;
	      break;
	    case '1':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=1&id='+id;
	      break;
	    case '2':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=2&id='+id;
	      break;
	    case '3':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=3&id='+id;
	      break;
	    case '4':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=4&id='+id;
	      break;
	    case '5':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=5&id='+id;
	      break;
	    case '6':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=6&id='+id;
	      break;
	    case '7':
	    	window.location.href = '../Controller/ManagerController.jsp?Submit=pList&cateno=7&id='+id;
	      break;
	    default:
	    	alert("Error");
	      break;
	  }
	}
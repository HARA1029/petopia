function category(cateno) {
	  switch (cateno) {
	    case '0':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=0';
	      break;
	    case '1':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=1';
	      break;
	    case '2':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=2';
	      break;
	    case '3':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=3';
	      break;
	    case '4':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=4';
	      break;
	    case '5':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=5';
	      break;
	    case '6':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=6';
	      break;
	    case '7':
	    	window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=7';
	      break;
	    default:
	    	alert("Error");
	      break;
	  }
	}
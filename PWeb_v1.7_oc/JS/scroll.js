	function ScrollArea(instName, areaName, totalCnt, perCnt, dispSize, speed, wait)	{
		this.instName 	= instName;	// 인스턴스명
		this.areaName 	= areaName;	// 이동할 영역 div id
		this.totalCnt 	= parseInt(totalCnt); 	//블럭 cnt 가 아닌 총 노출 데이터의 갯수;
		this.perCnt		= parseInt(perCnt);	//블럭당  데이터의 갯수;
		this.curIndex 	= 0;
		this.destIndex 	= 0;
		this.blockCnt 	= 0;	// 더미를 제외한 순수 블럭의 수
		this.dispSize 	= parseInt(dispSize);	// 블럭의 높이/넓이
		this.speed 		= parseInt(speed);		// 이동속도 : 클수록 빨라짐
 		if ( this.speed > this.dispSize ) 	{
			this.speed 	= this.dispSize;
		}
		this.autospeed 	= this.speed ;
		this.wait 		= parseInt(wait);			// 블럭 이동 후 대기 시간 milsec, 0 일 경우 자동 스크롤 하지 않는다.
		this.funcName 	= "";
		this.objTimeout	= 0;
		this.firstCall 	= true;
		this.scroll		= true;

		/* Set blockCnt */
		if ( this.totalCnt == 0 || this.perCnt == 0  )		{
			this.blockCnt = 0;
		}	else	{
			this.blockCnt = this.totalCnt/this.perCnt;

			if ( (""+this.blockCnt).indexOf(".") > -1)	{
				this.blockCnt = parseInt( (""+this.blockCnt).substring(0,(""+this.blockCnt).indexOf(".")) ) + 1;
			}
		}

		this.setBlockCnt = function(blockCnt)	{
			this.blockCnt = blockCnt;
		}


		this.getPosition =  function(index)	{
			return -( index * this.dispSize );
		}

		/* 스크롤 중지 */
		this.scrollStop = function()	{
			//this.firstCall = true;
			//clearTimeout(this.objTimeout);
			this.scroll = false;
		}

		/* 스크롤 재개 */
		this.scrollContinue = function()	{
			//this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			this.scroll = true;
		}


		/* 아래로 스크롤 */
		this.scrollDown = function()	{
			this.funcName = "scrollDown";
			clearTimeout(this.objTimeout);

			if ( this.blockCnt == 0 ) return;

			if ( this.firstCall  )	{
				if ( this.curIndex == this.blockCnt )	{
					this.curIndex = 0;
					document.getElementById(this.areaName).style.top = this.getPosition( this.curIndex ) ;
				}

				this.destIndex = this.curIndex + 1;
				this.firstCall = false;
			}

			if ( this.scroll )	{
				document.getElementById(this.areaName).style.top = parseInt(document.getElementById(this.areaName).style.top) - this.speed;
			}

			if ( parseInt( document.getElementById(this.areaName).style.top )  <  this.getPosition( this.destIndex  ) )		{

				document.getElementById(this.areaName).style.top = this.getPosition( this.destIndex ) ;
				this.curIndex = this.destIndex;

				this.firstCall = true;

				if ( parseInt(this.wait) > 0 )	{
					this.speed = this.autospeed;
					this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", this.wait);
				}
			}	else	{
				this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			}
		}



		/* 위로 스크롤  */

		this.scrollUp = function() {
			this.funcName = "scrollUp";
			clearTimeout(this.objTimeout);

			if ( this.blockCnt == 0 ) return;

			if ( this.firstCall  )	{
				if ( this.curIndex == 0 )	{
					this.curIndex = this.blockCnt;
					document.getElementById(this.areaName).style.top = this.getPosition( this.curIndex ) ;
				}

				this.destIndex = this.curIndex - 1;
				this.firstCall = false;
			}

			if ( this.scroll )	{
				document.getElementById(this.areaName).style.top = parseInt(document.getElementById(this.areaName).style.top) + this.speed;
			}

			if ( parseInt( document.getElementById(this.areaName).style.top )  >  this.getPosition( this.destIndex  ) )		{

				document.getElementById(this.areaName).style.top = this.getPosition( this.destIndex ) ;
				this.curIndex = this.destIndex;

				this.firstCall = true;

				if ( parseInt(this.wait) > 0 )	{
					this.speed = this.autospeed;
					this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", this.wait);
				}
			}	else	{
				this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			}

		}


		/* 우측으로 스크롤 */
		this.scrollRight = function()	{
			this.funcName = "scrollRight";
			clearTimeout(this.objTimeout);

			if ( this.blockCnt == 0 ) return;

			if ( this.firstCall  )	{
				if ( this.curIndex == this.blockCnt )	{
					this.curIndex = 0;
					document.getElementById(this.areaName).style.left = this.getPosition( this.curIndex ) ;
				}

				this.destIndex = this.curIndex + 1;
				this.firstCall = false;
			}

			if ( this.scroll )	{
				document.getElementById(this.areaName).style.left = parseInt(document.getElementById(this.areaName).style.left) - this.speed;
			}

			if ( parseInt( document.getElementById(this.areaName).style.left )  <  this.getPosition( this.destIndex  ) )		{

				document.getElementById(this.areaName).style.left = this.getPosition( this.destIndex ) ;
				this.curIndex = this.destIndex;

				this.firstCall = true;

				if ( parseInt(this.wait) > 0 )	{
					this.speed = this.autospeed;
					this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", this.wait);
				}
			}	else	{
				this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			}
		}

		/* 좌측으로 스크롤 */
		this.scrollLeft = function()	{
			this.funcName = "scrollLeft";
			clearTimeout(this.objTimeout);

			if ( this.blockCnt == 0 ) return;

			if ( this.firstCall  )	{
				if ( this.curIndex == 0 )	{
					this.curIndex = this.blockCnt;
					document.getElementById(this.areaName).style.left = this.getPosition( this.curIndex ) ;
				}

				this.destIndex = this.curIndex - 1;
				this.firstCall = false;
			}

			if ( this.scroll )	{
				document.getElementById(this.areaName).style.left = parseInt(document.getElementById(this.areaName).style.left) + this.speed;
			}

			if ( parseInt( document.getElementById(this.areaName).style.left )  >  this.getPosition( this.destIndex  ) )		{

				document.getElementById(this.areaName).style.left = this.getPosition( this.destIndex ) ;
				this.curIndex = this.destIndex;

				this.firstCall = true;

				if ( parseInt(this.wait) > 0 )	{
					this.speed = this.autospeed;
					this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", this.wait);
				}
			}	else	{
				this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			}
		}


		/* 버튼 클릭시 오토 스크롤과 다른 속도로 이동 시킬 경우 */
		this.clickDown = function(clickspeed)	{
			this.speed = parseInt(clickspeed);
			this.scrollDown();
		}

		this.clickUp = function(clickspeed)	{
			this.speed = parseInt(clickspeed);
			this.scrollUp();
		}

		this.clickLeft = function(clickspeed)	{
			this.speed = parseInt(clickspeed);
			this.scrollLeft();
		}

		this.clickRight = function(clickspeed)	{
			this.speed = parseInt(clickspeed);
			this.scrollRight();
		}
	}
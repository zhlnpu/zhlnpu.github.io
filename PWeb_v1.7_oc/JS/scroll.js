	function ScrollArea(instName, areaName, totalCnt, perCnt, dispSize, speed, wait)	{
		this.instName 	= instName;	// �ν��Ͻ���
		this.areaName 	= areaName;	// �̵��� ���� div id
		this.totalCnt 	= parseInt(totalCnt); 	//�� cnt �� �ƴ� �� ���� �������� ����;
		this.perCnt		= parseInt(perCnt);	//����  �������� ����;
		this.curIndex 	= 0;
		this.destIndex 	= 0;
		this.blockCnt 	= 0;	// ���̸� ������ ���� ���� ��
		this.dispSize 	= parseInt(dispSize);	// ���� ����/����
		this.speed 		= parseInt(speed);		// �̵��ӵ� : Ŭ���� ������
 		if ( this.speed > this.dispSize ) 	{
			this.speed 	= this.dispSize;
		}
		this.autospeed 	= this.speed ;
		this.wait 		= parseInt(wait);			// �� �̵� �� ��� �ð� milsec, 0 �� ��� �ڵ� ��ũ�� ���� �ʴ´�.
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

		/* ��ũ�� ���� */
		this.scrollStop = function()	{
			//this.firstCall = true;
			//clearTimeout(this.objTimeout);
			this.scroll = false;
		}

		/* ��ũ�� �簳 */
		this.scrollContinue = function()	{
			//this.objTimeout = setTimeout(this.instName + "." + this.funcName + "()", 1);
			this.scroll = true;
		}


		/* �Ʒ��� ��ũ�� */
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



		/* ���� ��ũ��  */

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


		/* �������� ��ũ�� */
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

		/* �������� ��ũ�� */
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


		/* ��ư Ŭ���� ���� ��ũ�Ѱ� �ٸ� �ӵ��� �̵� ��ų ��� */
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
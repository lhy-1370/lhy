*DOMAIN
DOMAIN1		 	GwIp=1.234.25.131
				SECURITY=USER
				OWNER=direa

				GwNodeName=p520

				HaActionFlag=0
				HaTimeout=10
				HaComfirmValue=3

*NODE
DEFAULT			RMH_USE_FLAG=0
				QMAT=4GB
				BLOCK_SIZE=4096
				SVC_PORT=8001
				MOND_PORT=17770

p520			NodeIp=1.234.25.131
				INFOTBL=0x90000001
				TPH_RQ_COUNT=2000
				EMS_SQ_COUNT=200
				EMS_RQ_COUNT=200
				RMH_RQ_COUNT=200
				PAT=1000
				DOMAINNAME=DOMAIN1
				TRC_MEM_FLAG=1


################################################################################
*SVRGROUP
################################################################################
cl_com 	 	NODENAME = "p520"
cfr_ap 	 	NODENAME = "p520"

be_adt		NODENAME = "p520"

cfr_adt0	NODENAME = "p520"
cfr_adt1	NODENAME = "p520"
cfr_adt2	NODENAME = "p520"

cfm_ap  	NODENAME = "p520"
cfm_adt 	NODENAME = "p520"

*RQ

*ROUTING



################################################################################
*SERVER
################################################################################
DEFAULT		 	OBJECTPATH=$CL_HOME/bin
			SVCCOUNT=1
			MIN=1
			MAX=1
			RQMSGCOUNT=500
			RQMSGSIZE=4096
			RQAT=100
			RQRAT=250
			BLOCKTIME=0
			ROUNDROBIN=1
			DBGTRACE=0
			BOOTDELAYTIME=0
			RESTARTDELAYTIME=3
			LOG_F_FLOW=0
			LOG_F_WARN=1
			LOG_F_ERROR=1
			LOG_F_ABEND=1
			LOG_F_LOCAL=yes
			RSOF_CUTOFFTIME=1000
			LOG_FCOUNT=2
			LOG_FSIZE=3
			SENDTIMEOUT=0
			AUTORESTART=-1

################################################################################
#	SERVER - devStudio
################################################################################
devagt		OBJECTPATH=$ROME_HOME/sysbin
			RQMSGCOUNT=10
			DEV_STUDIO=10002
			AUTORESTART=-1

################################################################################
#	SERVER - 실시간 engine server
################################################################################
# 실시간 Flow Master	###################################
cfr_b2e_mst		SVGNAME=cfr_ap
				MIN=5
				MAX=20
cfr_e2b_mst		SVGNAME=cfr_ap
				MIN=5
				MAX=20

# 실시간 로깅	###########################################
cfr_log_mst		SVGNAME=cfr_ap
				MIN=40
				MAX=60
cfr_log_data		SVGNAME=cfr_ap
				MIN=20
				MAX=40
cfr_log_img		SVGNAME=cfr_ap
				MIN=20
				MAX=40
cfr_log_err		SVGNAME=cfr_ap
				MIN=5
				MAX=20

# 실시간 통계 처리	#######################################
cfr_deal_sts		SVGNAME=cfr_ap

# 공통 모니터링		#######################################
cfc_sys_info		SVGNAME=cl_com
cfr_vps_view		SVGNAME=cl_com		# XML 서비스
cfr_usr_ctl     	SVGNAME=cl_com      # Reconfig Service

# 실시간 Timer	##########################################
cfr_tmr_set		SVGNAME=cfr_ap
cfr_tmr_chk		SVGNAME=cfr_ap

# 공통 배치		##########################################
cfc_bat_inf		SVGNAME=cl_com
cfc_bat_prc		SVGNAME=cl_com
cfc_bat_chk		SVGNAME=cl_com

# 관리전문		##########################################
cfr_adm_prc		SVGNAME=cfr_ap
cfr_adm_sch		SVGNAME=cfr_ap
cfr_adm_chk		SVGNAME=cfr_ap


# simulation 	##########################################
#cfr_tst_rcv		SVGNAME=cfr_sim
#cfr_tst_osnd 		SVGNAME=cfr_sim
#cfr_tst_osndfs		SVGNAME=cfr_sim

#	실시간 Site Service	##################################
cfr_add_hdr 	VGNAME=cfr_ap
		MIN=20
		MAX=60
cfr_cut_hdr 	SVGNAME=cfr_ap
		MIN=20
		MAX=60
#cfr_ebc_asc	SVGNAME=cfr_ap							# ascii <-> ebcdic : 미사용	
cfr_adm_core 	SVGNAME=cfr_ap
#cfr_syn_tmdm	SVGNAME=cfr_ap
#		OBJECTNAME=syn_tmdm
cfr_rcv_tmdm	SVGNAME=cfr_ap
		OBJECTNAME=rcv_tmdm
#cfr_mtp_mgr    SVGNAME=cfr_ap
#		OBJECTNAME=sv_sr_mtpsvc

#	CORE Service	##################################
core_rcv		SVGNAME=be_adt
                OBJECTNAME=sv_sr_chgtin
                MIN=3
                MAX=3

core_snd		SVGNAME=be_adt
                OBJECTNAME=sv_sr_tmaxbak
                MIN=2
                MAX=2

core_mgr  		SVGNAME=be_adt
                OBJECTNAME=sv_sr_tmaxmgr

core_chk		SVGNAME=be_adt
                OBJECTNAME=sv_sr_chktmax
                MIN=2
                MAX=2

core_ctl		SVGNAME=be_adt
				OBJECTNAME=sv_sr_dealctl
				MIN=1
				MAX=1

#   EAI Service ##################################
eai0_rcv        SVGNAME=be_adt					# EAI Async Recv Svc
                OBJECTNAME=sv_sr_chsvr

eai0_snd        SVGNAME=be_adt                  # EAI Async Send Svc
                OBJECTNAME=sv_sr_chcli

#eai0_svr_syn   SVGNAME=be_adt                  # EAI SVR SYNC : 미사용
#               OBJECTNAME=chgw_svr_syn

#   EAI Service ##################################
apm0_rcv        SVGNAME=be_adt
                OBJECTNAME=chgw_apm             # APM Recv Svc


################################################################################
#	SERVER - 일괄 engine server
################################################################################

# 일괄 flow master	######################################
cfm_b2e_mst	SVGNAME=cfm_ap
cfm_e2b_mst	SVGNAME=cfm_ap
cfm_file_dec	SVGNAME=cfm_ap
cfm_rzt_prc	SVGNAME=cfm_ap
cfm_newline		SVGNAME=cfm_ap

# 일괄 로깅		##########################################
cfm_log_err		SVGNAME=cfm_ap
cfm_log_mst		SVGNAME=cfm_ap

# 일괄 예약 	##########################################
cfm_rsv_chk	 SVGNAME=cfm_ap
cfm_rsv_reg	 SVGNAME=cfm_ap


################################################################################
#	SERVER - Adaptor server
################################################################################
# REAL : 실시간/일괄  Adaptor	###################################
bcc1			SVGNAME=cfr_adt1			# 비씨카드_은행업무 회원_온라인
                OBJECTNAME=tcp_com
bcc2			SVGNAME=cfr_adt1			# 비씨카드_승인,현금서비스_온라인
                OBJECTNAME=tcp_com
bcc4			SVGNAME=cfr_adt1			# 비씨카드_사고자_온라인
                OBJECTNAME=tcp_com
bcc5			SVGNAME=cfr_adt1			# 비씨카드_스피드비씨 실시간 이체_온라인
                OBJECTNAME=tcp_com
#bcc3_r			SVGNAME=cfm_adt				# 비씨카드_스피드비씨 CMS 파일 수신
#                OBJECTNAME=bccd_r
#bcc3_s			SVGNAME=cfr_adt1			# 비씨카드_스피드비씨 CMS 파일 송신
#                OBJECTNAME=bccd_s
#bccf_r			SVGNAME=cfm_adt				# 비씨카드_파일 수신 : 미사용-bc gate
#                OBJECTNAME=bccd_r
#bccf_s			SVGNAME=cfr_adt1			# 비씨카드_파일 송신 : 미사용-bc gate
#                OBJECTNAME=bccd_s
yggd			SVGNAME=cfr_adt1			# LG U+ 공무원 연금공단_온라인
                OBJECTNAME=tcp_com
hdc1			SVGNAME=cfr_adt1			# 현대카드_현금서비스_온라인
                OBJECTNAME=tcp_com
hdc2			SVGNAME=cfr_adt1			# 현대카드_LOAN 서비스_온라인
                OBJECTNAME=tcp_com
hdi1			SVGNAME=cfr_adt1			# 현대증권_증권제휴_온라인
                OBJECTNAME=tcp_com
ksn1			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_실시간이체 및 가상계좌_온라인
                OBJECTNAME=tcp_com
ksn2			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_실시간이체_온라인
                OBJECTNAME=tcp_com
ksn3			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_울산대 RCMS 업무_온라인
                OBJECTNAME=tcp_com
ksn4			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_자동차등록공채 전자처리_온라인
                OBJECTNAME=tcp_com
ksn5_r			SVGNAME=cfm_adt				# KSNET(한국무역정보통신)_CMS 파일 수신
                OBJECTNAME=ksnet_r
ksn5_s			SVGNAME=cfm_adt				# KSNET(한국무역정보통신)_CMS 파일 송신
                OBJECTNAME=ksnet_s
ksn6			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_펌뱅킹_온라인
                OBJECTNAME=tcp_com
ksn7			SVGNAME=cfr_adt1			# KSNET(한국무역정보통신)_주류카드_온라인
                OBJECTNAME=tcp_com
kwi1			SVGNAME=cfr_adt1			# 키움닷컴증권_증권제휴_온라인
                OBJECTNAME=tcp_com
hf02			SVGNAME=cfr_adt1         	# 한국주택금융공사_주택보증_온라인
				OBJECTNAME=tcp_com
hf04			SVGNAME=cfr_adt1	        # 한국주택금융공사_주택연금_온라인
				OBJECTNAME=tcp_com
hf06			SVGNAME=cfr_adt1         	# 한국주택금융공사_U-보금자리론 실시간 이체_온라인
				OBJECTNAME=tcp_com
hf07			SVGNAME=cfr_adt1         	# 한국주택금융공사_U-보금자리론_온라인
				OBJECTNAME=tcp_com
hf01_r			SVGNAME=cfm_adt          	# 한국주택금융공사_학자금_파일 수신
				OBJECTNAME=khfc_r
hf01_s			SVGNAME=cfm_adt          	# 한국주택금융공사_학자금_파일 송신
				OBJECTNAME=khfc_s
hf03_r			SVGNAME=cfm_adt          	# 한국주택금융공사_모기지론_파일_수신
				OBJECTNAME=khfc_r
hf03_s			SVGNAME=cfm_adt          	# 한국주택금융공사_모기지론_파일_송신
				OBJECTNAME=khfc_s
hf08_r			SVGNAME=cfm_adt          	# 한국주택금융공사_위탁보증_파일_수신
				OBJECTNAME=khfc_r
hf08_s			SVGNAME=cfm_adt          	# 한국주택금융공사_위탁보증_파일_송신
				OBJECTNAME=khfc_s
hf0f_r			SVGNAME=cfm_adt          	# 한국주택금융공사_U-보금자리론_파일_수신
				OBJECTNAME=khfc_r
hf0f_s			SVGNAME=cfm_adt          	# 한국주택금융공사_U-보금자리론_파일_송신
				OBJECTNAME=khfc_s
kib1			SVGNAME=cfr_adt1         	# KIBNET_실시간이체,펌뱅킹_온라인
				OBJECTNAME=tcp_com
kib3			SVGNAME=cfr_adt1         	# KIBNET_제휴CD업무_온라인
				OBJECTNAME=tcp_com
kib4			SVGNAME=cfr_adt1         	# KIBNET_학자금보증_온라인
				OBJECTNAME=tcp_com
kib5_r			SVGNAME=cfm_adt          	# KIBNET_주택금융공사_파일수신
				OBJECTNAME=khfc_r
kib5_s			SVGNAME=cfm_adt          	# KIBNET_주택금융공사_파일송신
				OBJECTNAME=kib_sel_s
kibf_r			SVGNAME=cfm_adt          	# KIBNET_실시간이체, 펌뱅킹 일괄_수신
				OBJECTNAME=kib_hf_r
kibf_s			SVGNAME=cfm_adt          	# KIBNET_실시간이체, 펌뱅킹 일괄_송신
				OBJECTNAME=van_s
nic1			SVGNAME=cfr_adt1         	# NICE_제휴CD 업무_온라인
				OBJECTNAME=tcp_com
nic3			SVGNAME=cfr_adt1         	# NICE_휴대폰인증 주민번호_온라인
				OBJECTNAME=tcp_com
#nic4			SVGNAME=cfr_adt1         	# NICE_휴대폰인증 생년월일_온라인
#				OBJECTNAME=tcp_com
nic7			SVGNAME=cfr_adt1         	# NICE_신용정보_온라인
				OBJECTNAME=tcp_com
nicc_s			SVGNAME=cfm_adt          	# NICE_신용정보 배치_송신
				OBJECTNAME=ftp_com
nick_r			SVGNAME=cfm_adt          	# NICE_기업정보조회(KIS) 배치_수신
				OBJECTNAME=ftp_nic_pub
kft0			SVGNAME=cfr_adt1			# 금융결제원_CD공동망_온라인
                OBJECTNAME=tcp_com
kft1			SVGNAME=cfr_adt1			# 금융결제원_ARS_온라인
                OBJECTNAME=tcp_com
kft2			SVGNAME=cfr_adt1         	# 금융결제원_스마트폰 지금결제_온라인
	    		OBJECTNAME=tcp_com
kft3			SVGNAME=cfr_adt1         	# 금융결제원_어음정보_온라인
   		 		OBJECTNAME=tcp_com
kft4			SVGNAME=cfr_adt1         	# 금융결제원_지로 실시간등록_온라인
   		 		OBJECTNAME=tcp_com
kft5			SVGNAME=cfr_adt1         	# 금융결제원_타행환_온라인 
	   	 		OBJECTNAME=tcp_com
kft6			SVGNAME=cfr_adt1         	# 금융결제원_경찰망_온라인
				OBJECTNAME=tcp_com
kft7			SVGNAME=cfr_adt1         	# 금융결제원_전자금융공동망/주류(물류구매)_온라인
				OBJECTNAME=tcp_com
kft8			SVGNAME=cfr_adt1         	# 금융결제원_PG망_온라인
				OBJECTNAME=tcp_com
kft9			SVGNAME=cfr_adt1         	# 금융결제원_IC 리더폰_온라인
    			OBJECTNAME=tcp_com
kfta			SVGNAME=cfr_adt1         	# 금융결제원_현금IC구매_온라인
    			OBJECTNAME=tcp_com
kftc			SVGNAME=cfr_adt1         	# 금융결제원_B2B-B2B전자채권_온라인
	    		OBJECTNAME=tcp_com
kftd			SVGNAME=cfr_adt1         	# 금융결제원_뱅크라인_온라인
		    	OBJECTNAME=tcp_com
kfte_r			SVGNAME=cfm_adt          	# 금융결제원_은행CMS_파일 수신 
	    		OBJECTNAME=kftc_bk_cms_r
kfte_s			SVGNAME=cfm_adt          	# 금융결제원_은행CMS_파일 송신 
	    		OBJECTNAME=kftc_bk_cms_s
#kftf_r			SVGNAME=cfm_adt          	# 금융결제원_CMS_파일 수신
#				OBJECTNAME=kftc_cms_r
kftf_s			SVGNAME=cfm_adt          	# 금융결제원_CMS_파일 송신
				OBJECTNAME=kftc_cms_s
kfth			SVGNAME=cfr_adt1         	# 금융결제원_전자어음_온라인
				OBJECTNAME=tcp_com
kfti			SVGNAME=cfr_adt1         	# 금융결제원_인터넷지로_온라인
    			OBJECTNAME=tcp_com
kftl			SVGNAME=cfr_adt1         	# 금융결제원_CLS(외화동시결제시스템)_온라인
    			OBJECTNAME=tcp_com
kftm			SVGNAME=cfr_adt1         	# 금융결제원_CMS_온라인
    			OBJECTNAME=tcp_com
kfto			SVGNAME=cfr_adt1         	# 금융결제원_지역개발공채_온라인
    			OBJECTNAME=tcp_com
kftp			SVGNAME=cfr_adt1         	# 금융결제원_네트워크론_온라인
    			OBJECTNAME=tcp_com
kftq			SVGNAME=cfr_adt1         	# 금융결제원_출국정보조회_온라인
    			OBJECTNAME=tcp_com
kftr_r			SVGNAME=cfm_adt          	# 금융결제원_일괄전송 수신
    			OBJECTNAME=kftc_r
kftr_s			SVGNAME=cfm_adt          	# 금융결제원_일괄전송 송신
    			OBJECTNAME=kftc_s
kfts_r			SVGNAME=cfm_adt          	# 금융결제원_지역교육재정 배치 수신
    			OBJECTNAME=kftc_edu_r
kfts_s			SVGNAME=cfm_adt          	# 금융결제원_지역교육재정 배치 송신 
    			OBJECTNAME=kftc_edu_s
kftt			SVGNAME=cfr_adt1         	# 금융결제원_지역교육재정_온라인
    			OBJECTNAME=tcp_com
kftu			SVGNAME=cfr_adt1         	# 금융결제원_국내외화자금이체_온라인
				OBJECTNAME=tcp_com
kftv			SVGNAME=cfr_adt1         	# 금융결제원_전자수입인지_온라인
				OBJECTNAME=tcp_com
#kftw			SVGNAME=cfr_adt1         	# 금융결제원_신분증진위여부_온라인 : 차세대 오픈 제외
#				OBJECTNAME=tcp_com
kfb1			SVGNAME=cfr_adt1         	# 은행연합회_신용정보_온라인
    			OBJECTNAME=tcp_com
kfb2			SVGNAME=cfr_adt1         	# 은행연합회_세금우대_온라인
    			OBJECTNAME=tcp_com
kfb3			SVGNAME=cfr_adt1         	# 은행연합회_휴면예금_온라인
				OBJECTNAME=tcp_com
kfba_r			SVGNAME=cfm_adt          	# 은행연합회_신용정보 배치 수신
				OBJECTNAME=kfb_r
kfba_s			SVGNAME=cfm_adt          	# 은행연합회_신용정보 배치 송신
				OBJECTNAME=kfb_s
kfbb_r			SVGNAME=cfm_adt          	# 은행연합회_세금우대 배치 수신
				OBJECTNAME=kfb_r
kfbb_s			SVGNAME=cfm_adt          	# 은행연합회_세금우대 배치 송신
				OBJECTNAME=kfb_s
kfbc_r			SVGNAME=cfm_adt          	# 은행연합회_휴먼예금 배치 수신
				OBJECTNAME=kfb_r
kfbc_s			SVGNAME=cfm_adt          	# 은행연합회_휴먼예금 배치 송신
				OBJECTNAME=kfb_s
ssb1			SVGNAME=cfr_adt1         	# 서울보증보험_모기지신용보험(MCI)_온라인
	    		OBJECTNAME=tcp_com
ssb2			SVGNAME=cfr_adt1         	# 서울보증보험_신용보증보험_온라인
	    		OBJECTNAME=tcp_com
ssb3			SVGNAME=cfr_adt1         	# 서울보증보험_전세자금보증_온라인
    			OBJECTNAME=tcp_com
ssb4			SVGNAME=cfr_adt1         	# 서울보증보험_모기지보험(MI)_온라인
				OBJECTNAME=tcp_com
ssb5			SVGNAME=cfr_adt1         	# 서울보증보험_우량직장인보험_온라인
				OBJECTNAME=tcp_com
cnet			SVGNAME=cfr_adt1         	# 청호이지캐쉬(청호컴넷)_제휴CD업무_온라인
				OBJECTNAME=tcp_com
ehs1			SVGNAME=cfr_adt1         	# 이지스효성_한국전력가상계좌_온라인
	    		OBJECTNAME=tcp_sync
ehsf_r			SVGNAME=cfm_adt          	# 이지스효성_한국전력가상계좌 배치 수신
	    		OBJECTNAME=ehsf_r
ehsf_s			SVGNAME=cfm_adt          	# 이지스효성_한국전력가상계좌 배치 송신
	    		OBJECTNAME=ehsf_s
kmco			SVGNAME=cfr_adt1         	# 한국자산관리공사_바꿔드림론(BDRL)_온라인
	    		OBJECTNAME=tcp_com
kri1			SVGNAME=cfr_adt1         	# 한국투자증권_증권제휴_온라인
	    		OBJECTNAME=tcp_com
ksd1			SVGNAME=cfr_adt1         	# 한국예탁결제원_펀드판매사이동_온라인
				OBJECTNAME=tcp_com
ltc1			SVGNAME=cfr_adt1         	# 롯데카드_전문계카드_온라인
				OBJECTNAME=tcp_com
ltc2			SVGNAME=cfr_adt1         	# 롯데카드_LOAN 서비스_온라인
				OBJECTNAME=tcp_com
ltc3			SVGNAME=cfr_adt1         	# 롯데카드_체크카드_온라인
				OBJECTNAME=tcp_com
mai1			SVGNAME=cfr_adt1         	# 미래에셋증권_증권제휴_온라인
				OBJECTNAME=tcp_com
ccrs			SVGNAME=cfr_adt1         	# 신용회복위원회_학자금전환대출보증_온라인
				OBJECTNAME=tcp_com
ccrf_r			SVGNAME=cfm_adt          	# 신용회복위원회_학자금전환대출보증 배치 수신
				OBJECTNAME=kftc_opn_r
ccrf_s			SVGNAME=cfm_adt          	# 신용회복위원회_학자금전환대출보증 배치 송신
				OBJECTNAME=kftc_opn_s
cns1			SVGNAME=cfr_adt1         	# LGCNS_실시간이체_온라인
				OBJECTNAME=tcp_com
cns2			SVGNAME=cfr_adt1         	# LG U+_전자금융서버용_온라인
				OBJECTNAME=tcp_cns_enc
cns3_r			SVGNAME=cfr_adt1         	# LG U+_CMS_온라인_SERVER
				OBJECTNAME=tcp_com
cns3			SVGNAME=cfr_adt1         	# LG U+_CMS_온라인_CLIENT
				OBJECTNAME=tcp_com
				MIN=3
				MAX=5
cns4			SVGNAME=cfr_adt1         	# LG U+_외화 서비스_온라인
				OBJECTNAME=tcp_com
lgu1			SVGNAME=cfr_adt1         	# LG U+_외화 서비스_온라인
				OBJECTNAME=tcp_com
cnsf_r			SVGNAME=cfm_adt          	# LGCNS_CMS 배치 수신
				OBJECTNAME=uplus_r
cnsf_s			SVGNAME=cfm_adt          	# LGCNS_CMS 배치 송신
				OBJECTNAME=uplus_s
cnsm_r			SVGNAME=cfm_adt          	# LGCNS_메일박스 수신
				OBJECTNAME=cns_r
cnsm_s			SVGNAME=cfm_adt          	# LGCNS_메일박스 송신
				OBJECTNAME=cns_s
hgsm			SVGNAME=cfr_adt1         	# 흥국생명_실시간이체_온라인
				OBJECTNAME=tcp_com
hyos			SVGNAME=cfr_adt1         	# 노틸러스효성_제휴CD 업무_온라인
				OBJECTNAME=tcp_com
imc1			SVGNAME=cfr_adt1         	# IMC_아파트관리금_온라인
				OBJECTNAME=tcp_com
imcf_r			SVGNAME=cfm_adt          	# IMC_아파트관리금_파일 수신
				OBJECTNAME=van_r
imcf_s			SVGNAME=cfm_adt          	# IMC_아파트관리금_파일 송신
				OBJECTNAME=van_s
ins1			SVGNAME=cfr_adt1         	# 이니시스_온라인
				OBJECTNAME=tcp_com
jysb			SVGNAME=cfr_adt1         	# 지역신용보증재단(경남/부산)_전자보증서업무_온라인
				OBJECTNAME=tcp_com
myb1			SVGNAME=cfr_adt1         	# 마이비_마이비교통_온라인
				OBJECTNAME=tcp_com
mybf_r			SVGNAME=cfm_adt          	# 마이비_마이비교통_파일 수신 
				OBJECTNAME=mybi_r
mybf_s			SVGNAME=cfm_adt          	# 마이비_마이비교통_파일 송신 
				OBJECTNAME=mybi_s
ofc1			SVGNAME=cfr_adt1         	# 한국정책금융공사_온랜딩대출_온라인
				OBJECTNAME=tcp_kofc
ofc1_r			SVGNAME=cfr_adt1         	# 한국정책금융공사_온랜딩대출_온라인
				OBJECTNAME=tcp_kofc
ofcf_r			SVGNAME=cfm_adt          	# 한국정책금융공사_온랜딩대출_파일 수신
				OBJECTNAME=kofc_r
ofcf_s			SVGNAME=cfm_adt          	# 한국정책금융공사_온랜딩대출_파일 송신
				OBJECTNAME=kofc_s
sds1			SVGNAME=cfr_adt1         	# 삼성SDS_실시간이체-삼성생명_온라인 
				OBJECTNAME=tcp_com
sds2			SVGNAME=cfr_adt1         	# 삼성SDS_실시간이체-펌뱅킹_온라인 
				OBJECTNAME=tcp_com
sdsm_r			SVGNAME=cfm_adt          	# 삼성SDS_메일박스 수신
				OBJECTNAME=sdsm_r
sdsm_s			SVGNAME=cfm_adt          	# 삼성SDS_메일박스 송신
				OBJECTNAME=sdsm_s
shc1			SVGNAME=cfr_adt1         	# 신한카드_실시간이체_온라인 
				OBJECTNAME=tcp_com
shc3			SVGNAME=cfr_adt1         	# 신한카드_체크카드_온라인
				OBJECTNAME=tcp_com
shc5			SVGNAME=cfr_adt1         	# 신한카드_거래내역통지_온라인
				OBJECTNAME=tcp_com
shc6			SVGNAME=cfr_adt1         	# 신한캐피탈_거래내역통지_온라인
				OBJECTNAME=tcp_com
shc7			SVGNAME=cfr_adt1         	# 신한카드_온라인이체_온라인
				OBJECTNAME=tcp_com
shc8			SVGNAME=cfr_adt1         	# 신한카드_가상계좌 거래내역통지_온라인
				OBJECTNAME=tcp_com
shi1			SVGNAME=cfr_adt1         	# 신한증권_증권제휴_온라인
				OBJECTNAME=tcp_com
skcc			SVGNAME=cfr_adt1         	# SK 텔레콤_실시간이체_온라인
				OBJECTNAME=tcp_com
skcf_r			SVGNAME=cfm_adt          	# SK 텔레콤_실시간이체_일괄 수신
				OBJECTNAME=van_r
skcf_s			SVGNAME=cfm_adt          	# SK 텔레콤_실시간이체_일괄 송신
				OBJECTNAME=van_s
ssc1			SVGNAME=cfr_adt1         	# 삼성카드_전문계카드_온라인
				OBJECTNAME=tcp_com
ssc2			SVGNAME=cfr_adt1         	# 삼성카드_체크카드_온라인
				OBJECTNAME=tcp_com
ssc3			SVGNAME=cfr_adt1         	# 삼성카드_실시간이체-삼성카드_온라인
				OBJECTNAME=tcp_com
ssc4			SVGNAME=cfr_adt1         	# 삼성카드_실시간이체(집금)_온라인 
				OBJECTNAME=tcp_com
ssc5			SVGNAME=cfr_adt1         	# 삼성카드_거래내역통지_온라인
				OBJECTNAME=tcp_com
stb1			SVGNAME=cfr_adt1         	# 세틀뱅크_실시간이체_온라인
				OBJECTNAME=tcp_com
stb2			SVGNAME=cfr_adt1         	# 세틀뱅크_가상계좌 및 거래내역 통지_온라인
				OBJECTNAME=tcp_com
stbf_r			SVGNAME=cfm_adt          	# 세틀뱅크_일괄 송수신
				OBJECTNAME=van_r
stbf_s			SVGNAME=cfm_adt         	# 세틀뱅크_일괄 송수신
				OBJECTNAME=van_s
wwm1			SVGNAME=cfr_adt1         	# 우리투자증권_담보유가증권_온라인
				OBJECTNAME=tcp_com
wwm2			SVGNAME=cfr_adt1         	# 우리투자증권_경남지역채권_온라인
				OBJECTNAME=tcp_com
wwm3			SVGNAME=cfr_adt1         	# 우리투자증권_증권제휴_온라인
				OBJECTNAME=tcp_com
wwma_r			SVGNAME=cfm_adt          	# 우리투자증권_담보유가증권 일괄 수신
				OBJECTNAME=wwm_r
wwma_s			SVGNAME=cfm_adt          	# 우리투자증권_담보유가증권 일괄 송신
				OBJECTNAME=kfb_s
wwmf_r			SVGNAME=cfm_adt          	# 우리투자증권_지역개발채권 일괄 수신
				OBJECTNAME=kfb_r
wwmf_s			SVGNAME=cfm_adt          	# 우리투자증권_지역개발채권 일괄 송신
				OBJECTNAME=kfb_s
fsa1            SVGNAME=cfr_adt1         	# 금융보안연구원_OTP카드_온라인
                OBJECTNAME=tcp_com
fsa2            SVGNAME=cfr_adt1         	# 금융보안연구원_OTP카드_온라인
                OBJECTNAME=tcp_com
ssf0            SVGNAME=cfr_adt1         	# 삼성화재_실시간이체_온라인
                OBJECTNAME=tcp_com
ssi1            SVGNAME=cfr_adt1         	# 삼성증권_증권제휴_온라인
                OBJECTNAME=tcp_com
ecb1            SVGNAME=cfr_adt1         	# EC뱅크_전자어음-현대자동차 위아_온라인
                OBJECTNAME=tcp_com
ecb2            SVGNAME=cfr_adt1         	# EC뱅크_외화자금이체_온라인
                OBJECTNAME=tcp_com
ecb4            SVGNAME=cfr_adt1         	# EC뱅크_가상계좌및 실시간이체_온라인
                OBJECTNAME=tcp_com
ecbf_r          SVGNAME=cfm_adt          	# EC뱅크_배치 수신
                OBJECTNAME=ecbank_r
ecbf_s          SVGNAME=cfm_adt          	# EC뱅크_배치 송신
                OBJECTNAME=ecbank_s
khgc            SVGNAME=cfr_adt1         	# 대한주택보증_전세자금보증_온라인
                OBJECTNAME=tcp_com
khgf_r          SVGNAME=cfm_adt          	# 대한주택보증_전세자금보증 일괄 수신
                OBJECTNAME=khgc_r
khgf_s          SVGNAME=cfm_adt          	# 대한주택보증_전세자금보증 일괄 송신
                OBJECTNAME=khgc_s
lig1            SVGNAME=cfr_adt1         	# LIG 손해보험_전세자금대출_온라인
                OBJECTNAME=tcp_com
kait            SVGNAME=cfr_adt1         	# 한국정보통신산업협회_외국인정보인증_온라인
                OBJECTNAME=tcp_sync
kap1            SVGNAME=cfr_adt1         	# 한국감정평가협회_온라인
                OBJECTNAME=tcp_com
kcb1            SVGNAME=cfr_adt1         	# KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_온라인
                OBJECTNAME=tcp_com
kcb3            SVGNAME=cfr_adt1         	# KCB(코리아크레딧뷰로)_신도로명주소_온라인
                OBJECTNAME=tcp_com
kcb2_r          SVGNAME=cfm_adt          	# KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_배치 수신
                OBJECTNAME=kcb_r
kcb2_s          SVGNAME=cfm_adt          	# KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_배치 송신
                OBJECTNAME=kcb_s
kcbf_s          SVGNAME=cfm_adt          	# KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_배치 송신
                OBJECTNAME=ftp_com
ked4            SVGNAME=cfr_adt1         	# KED(한국기업데이타)_연체정보공유망(CB정보조회)_온라인
                OBJECTNAME=tcp_sync
ked1_r          SVGNAME=cfm_adt          	# KED(한국기업데이타)_연체정보 외_파일 수신
                OBJECTNAME=sftp_com
ked3_r          SVGNAME=cfm_adt          	# KED(한국기업데이타)_KED 정보조회_파일 수신
                OBJECTNAME=ked_r
ked3_s          SVGNAME=cfm_adt          	# KED(한국기업데이타)_KED 정보조회_파일 송신
                OBJECTNAME=ked_s
mcp1            SVGNAME=cfr_adt1         	# 하렉스인포텍_모카페이_온라인
                OBJECTNAME=tcp_com
tat1            SVGNAME=cfr_adt1         	# 씽크에이티_투채널인증_온라인
                OBJECTNAME=tcp_com
wch1            SVGNAME=cfr_adt1         	# 웹캐시_연구비통합관리_온라인
                OBJECTNAME=tcp_com
wch2            SVGNAME=cfr_adt1         	# BGF캐시넷_제휴CD 업무_온라인
                OBJECTNAME=tcp_com
wch3            SVGNAME=cfr_adt1         	# 웹캐시_가상계좌_온라인
                OBJECTNAME=tcp_com
wch4            SVGNAME=cfr_adt1         	# 웹캐시_전자어음_온라인
                OBJECTNAME=tcp_com
wch5            SVGNAME=cfr_adt1         	# 웹캐시_기업 CMS_온라인
                OBJECTNAME=tcp_com
wchf_adt        SVGNAME=cfm_adt          	# 웹캐시_가상계좌 가상 어뎁터
                OBJECTNAME=tcp_com
wchf_r          SVGNAME=cfm_adt          	# 웹캐시_가상계좌 일괄 수신
                OBJECTNAME=van_vadt_r
wchf_s          SVGNAME=cfm_adt          	# 웹캐시_가상계좌 일괄 송신
                OBJECTNAME=van_vadt_s
hnet            SVGNAME=cfr_adt1         	# HANNET_제휴CD 업무_온라인
                OBJECTNAME=tcp_com
hne1            SVGNAME=cfr_adt1         	# HANNET_운영자금청구_온라인
                OBJECTNAME=tcp_com
kis1            SVGNAME=cfr_adt1         	# KISBANK_제휴CD 업무_온라인
                OBJECTNAME=tcp_com
wrc1            SVGNAME=cfr_adt1         	# 우리카드_아이사랑체크결재_온라인
                OBJECTNAME=tcp_com
doc1            SVGNAME=cfr_adt1         	# 경남에너지_도시가스납부_온라인
                OBJECTNAME=tcp_sync
dsi1            SVGNAME=cfr_adt1         	# 대신증권_증권제휴_온라인 
                OBJECTNAME=tcp_com
dst1            SVGNAME=cfr_adt1         	# IMC_동서ITS(펌뱅킹)_온라인 
                OBJECTNAME=tcp_com
dstf_r          SVGNAME=cfm_adt          	# IMC_동서ITS 배치_수신 
                OBJECTNAME=van_r
dstf_s          SVGNAME=cfm_adt          	# IMC_동서ITS 배치_송신
                OBJECTNAME=van_s
bok1            SVGNAME=cfr_adt1         	# 한국은행_외환_온라인 
                OBJECTNAME=tcp_com
boko            SVGNAME=cfr_adt1         	# 한국은행_국고_온라인
                OBJECTNAME=tcp_bok
bok2            SVGNAME=cfr_adt1         	# 한국은행_신한은망_온라인 : 차세대 오픈 제외
                OBJECTNAME=tcp_bok
boka_r			SVGNAME=cfm_adt          	# 한국은행_국고배치_수신
                OBJECTNAME=bok_nf_r
boka_s			SVGNAME=cfm_adt          	# 한국은행_국고배치_송신
                OBJECTNAME=bok_nf_s
bokb_r			SVGNAME=cfm_adt          	# 한국은행_외환배치_수신
                OBJECTNAME=bok_fx_r
bokb_s			SVGNAME=cfm_adt          	# 한국은행_외환배치_송신
                OBJECTNAME=bok_fx_s
bokf_r			SVGNAME=cfm_adt          	# 한국은행_신한은망_수신 : 차세대 오픈 제외
                OBJECTNAME=bok_r
bokf_s			SVGNAME=cfm_adt          	# 한국은행_신한은망_송신 : 차세대 오픈 제외
                OBJECTNAME=bok_s

# 암복호화 TEST 어댑터 
test_seed       SVGNAME=cfr_adt1         	# 한국은행_외환_온라인 
                OBJECTNAME=tcp_com

song			SVGNAME=cfr_adt1
				OBJECTNAME=tcp_com
################################################################################
#	SERVER - 일괄 Adaptor server
################################################################################
# REAL : 일괄 Adaptor	###################################


################################################################################
*SERVICE
################################################################################

################################################################################
#	SERVICE - 실시간 engine service
################################################################################
CFR_B2E_MST		SVRNAME=cfr_b2e_mst			# CruzLink 실시간 업무 Flow Master	
CFR_E2B_MST		SVRNAME=cfr_e2b_mst 		# CruzLink 실시간 업무 Flow Master 

CFR_LOG_MST		SVRNAME=cfr_log_mst			# CruzLink 실시간 업무 로깅 Engine
CFR_LOG_DATA	SVRNAME=cfr_log_data		# CruzLink 실시간 업무 로깅 Engine
CFR_LOG_IMG		SVRNAME=cfr_log_img			# CruzLink 실시간 이미지 로그
CFR_LOG_ERR		SVRNAME=cfr_log_err			# CruzLink 실시간 에러로깅

CFR_DEAL_STS	SVRNAME=cfr_deal_sts		# CruzLink 실시간 업무 통계처리

CFC_SYS_INFO	SVRNAME=cfc_sys_info		# CruzLink 실시간 자원 현황 파악 
CFR_VPS_VIEW	SVRNAME=cfr_vps_view		# CruzManager 처리
CFR_USR_CTL     SVRNAME=cfr_usr_ctl         # 환경 및 전문, 채널 정보 적용

CFR_TMR_SET		SVRNAME=cfr_tmr_set			# CruzLink 실시간 타이머 SET
CFR_TMR_CHK		SVRNAME=cfr_tmr_chk			# CruzLink 실시간 타이머 CHK


CFC_BAT_INF		SVRNAME=cfc_bat_inf			# 배치 예약
CFC_BAT_PRC		SVRNAME=cfc_bat_prc			# 배치 실행
CFC_BAT_CHK		SVRNAME=cfc_bat_chk			# 배치 체크

CFR_ADM_PRC		SVRNAME=cfr_adm_prc			# 관리전문 처리
CFR_ADM_SCH		SVRNAME=cfr_adm_sch			# 관리전문 예약처리
CFR_ADM_CHK		SVRNAME=cfr_adm_chk			# 관리전문 에러 체크

#CFR_TST_RCV	SVRNAME=cfr_tst_rcv			# 시뮬레이터 응답수신 (취급/개설거래)
#CFR_TST_OSND 	SVRNAME=cfr_tst_osnd		# 시뮬레이터 전문송신 (개설거래)
#CFR_TST_OSNDFS	SVRNAME=cfr_tst_osndfs		# 시뮬레이터 파일송신 (개설거래)

#	실시간 Site Service ----------------------------------------------------
CFR_ADD_HDR 	SVRNAME=cfr_add_hdr			# add header
CFR_CUT_HDR 	SVRNAME=cfr_cut_hdr			# cut header
#CFR_EBC_ASC 	SVRNAME=cfr_ebc_asc			# ascii <-> ebcdic : 미사용
CFR_ADM_CORE 	SVRNAME=cfr_adm_core		# 관리전문 처리
#CFR_SYN_TMDM	SVRNAME=cfr_syn_tmdm		# 통합전문관리 정보 동기화
CFR_RCV_TMDM	SVRNAME=cfr_rcv_tmdm		# 통합전문관리 전문 이관 수신
#CFR_MTP_MGR     SVRNAME=cfr_mtp_mgr         # TP Event 타입별 분류 처리 서비스

#	CORE Service	--------------------------------------------------------
CORE_SND   		 SVRNAME=core_snd
CORE_SND_INF 	 SVRNAME=core_snd

CORE_RCV		 SVRNAME=core_rcv
CORE_RCV_INF     SVRNAME=core_rcv

CORE_CHK		 SVRNAME=core_chk

CORE_MGR    SVRNAME=core_mgr

CORE_CTLIR		SVRNAME=core_ctl
CORE_DEALR		SVRNAME=core_ctl
CORE_LIMIT		SVRNAME=core_ctl

#   EAI Service --------------------------------------------------------
EAI0_RCV        SVRNAME=eai0_rcv            # DEAI RECV ADT
EAI0_RCV_INF    SVRNAME=eai0_rcv
EAI0_SND        SVRNAME=eai0_snd            # EAI SEND ADT
EAI0_SND_INF    SVRNAME=eai0_snd
#EAI0_SVR_SYN    SVRNAME=eai0_svr_syn        # EAI SYNC MODE : 미사용
#EAI0_SVR_S_INF  SVRNAME=eai0_svr_syn        # EAI SYNC MODE : 미사용

#   APM Service --------------------------------------------------------
APM0_RCV        SVRNAME=apm0_rcv            # DEAI RECV ADT
APM0_RCV_INF    SVRNAME=apm0_rcv            # DEAI RECV ADT


################################################################################
#	SERVICE - 일괄 engine service
################################################################################
CFM_B2E_MST		SVRNAME=cfm_b2e_mst			# CruzLink 일괄 업무 Flow Master
CFM_E2B_MST		SVRNAME=cfm_e2b_mst 		# CruzLink 일괄 업무 Flow Master
CFM_FILE_DEC	SVRNAME=cfm_file_dec		# 일괄 파일 발견
CFM_RZT_PRC	 	SVRNAME=cfm_rzt_prc		 	# 일괄 결과 처리
CFM_NEWLINE		SVRNAME=cfm_newline			# 일괄 파일 개행처리

CFM_LOG_MST	 	SVRNAME=cfm_log_mst			# CruzLink 일괄 마스터로깅
CFM_LOG_ERR	 	SVRNAME=cfm_log_err			# CruzLink 일괄 에러로깅

CFM_RSV_CHK	 	SVRNAME=cfm_rsv_chk			# 일괄 예약 처리 체크
CFM_RSV_REG	 	SVRNAME=cfm_rsv_reg			# 일괄 예약 등록


################################################################################
#	SERVICE -  Adaptor service
################################################################################
# REAL : 실시간/일괄  Adaptor	###################################
BCC1			SVRNAME=bcc1				 # 비씨카드_은행업무 회원_온라인
BCC2			SVRNAME=bcc2				 # 비씨카드_승인,현금서비스_온라인
BCC4			SVRNAME=bcc4				 # 비씨카드_사고자_온라인
BCC5			SVRNAME=bcc5				 # 비씨카드_스피드비씨 실시간 이체_온라인
#BCC3_R			SVRNAME=bcc3_r				 # 비씨카드_스피드비씨 CMS 파일 수신 : 미사용-bc gate
#BCC3_S			SVRNAME=bcc3_s				 # 비씨카드_스피드비씨 CMS 파일 송신 : 미사용-bc gate
#BCCF_R			SVRNAME=bccf_r				 # 비씨카드_파일 수신 : 미사용-bc gate
#BCCF_S			SVRNAME=bccf_s				 # 비씨카드_파일 송신 : 미사용-bc gate
YGGD			SVRNAME=yggd				 # LG U+ 공무원 연금공단_온라인
HDC1			SVRNAME=hdc1				 # 현대카드_현금서비스_온라인
HDC2			SVRNAME=hdc2				 # 현대카드_LOAN 서비스_온라인
HDI1			SVRNAME=hdi1				 # 현대증권_증권제휴_온라인
KSN1			SVRNAME=ksn1				 # KSNET_실시간이체 및 가상계좌_온라인
KSN2			SVRNAME=ksn2				 # KSNET_실시간이체 및 가상계좌_온라인
KSN3			SVRNAME=ksn3				 # KSNET_울산대 RCMS 업무_온라인
KSN4			SVRNAME=ksn4				 # KSNET_자동차등록공채 전자처리_온라인
KSN5_R			SVRNAME=ksn5_r				 # KSNET_CMS_파일 수신
KSN5_S			SVRNAME=ksn5_s				 # KSNET_CMS_파일 송신
KSN6			SVRNAME=ksn6				 # KSNET_펌뱅킹_온라인
KSN7			SVRNAME=ksn7				 # KSNET_CMS_온라인
KWI1			SVRNAME=kwi1				 # 키움닷컴증권_증권제휴_온라인 
HF02			SVRNAME=hf02				 # 한국주택금융공사_주택보증_온라인
HF04			SVRNAME=hf04				 # 한국주택금융공사_주택연금_온라인
HF06			SVRNAME=hf06				 # 한국주택금융공사_U-보금자리론_온라인
HF07			SVRNAME=hf07				 # 한국주택금융공사_U-보금자리론_온라인
HF01_R			SVRNAME=hf01_r				 # 한국주택금융공사_학자금_파일 수신
HF01_S			SVRNAME=hf01_s				 # 한국주택금융공사_학자금_파일 송신
HF03_R			SVRNAME=hf03_r				 # 한국주택금융공사_모기지론_파일 수신
HF03_S			SVRNAME=hf03_s				 # 한국주택금융공사_모기지론_파일 송신
HF08_R			SVRNAME=hf08_r				 # 한국주택금융공사_위탁보증_파일 수신
HF08_S			SVRNAME=hf08_s				 # 한국주택금융공사_위탁보증_파일 송신
HF0F_R			SVRNAME=hf0f_r				 # 한국주택금융공사_U-보금자리론_파일수신
HF0F_S			SVRNAME=hf0f_s				 # 한국주택금융공사_U-보금자리론_파일송신
KIB1			SVRNAME=kib1				 # KIBNET_실시간이체,펌뱅킹_온라인
KIB3			SVRNAME=kib3				 # KIBNET_제휴CD 업무_온라인
KIB4			SVRNAME=kib4				 # KIBNET_학자금보증_온라인
KIB5_R			SVRNAME=kib5_r				 # KIBNET_주택금융공사_파일수신
KIB5_S			SVRNAME=kib5_s				 # KIBNET_주택금융공사_파일송신
KIBF_R			SVRNAME=kibf_r				 # KIBNET_실시간이체, 펌뱅킹_파일수신
KIBF_S			SVRNAME=kibf_s				 # KIBNET_실시간이체, 펌뱅킹_파일송신
NIC1			SVRNAME=nic1				 # NICE_제휴CD 업무_온라인
NIC3			SVRNAME=nic3				 # NICE_휴대폰인증 주민번호_온라인
#NIC4			SVRNAME=nic4				 # NICE_휴대폰인증 생년월일_온라인
NIC7			SVRNAME=nic7				 # NICE_신용정보_온라인
NICC_S			SVRNAME=nicc_s				 # NICE_신용정보_배치 송신
NICK_R			SVRNAME=nick_r				 # NICE_기업정보조회_파일 수신
KFT0			SVRNAME=kft0				 # 금융결제원_CD공동망_온라인
KFT1			SVRNAME=kft1				 # 금융결제원_ARS_온라인
KFT2			SVRNAME=kft2				 # 금융결제원_무역망_온라인
KFT3			SVRNAME=kft3				 # 금융결제원_어음정보_온라인
KFT4			SVRNAME=kft4				 # 금융결제원_지로 실시간등록_온라인
KFT5			SVRNAME=kft5				 # 금융결제원_타행환_온라인
KFT6			SVRNAME=kft6				 # 금융결제원_경찰망_온라인
KFT7			SVRNAME=kft7				 # 금융결제원_전자금융공동망/주류(물류구매)_온라인
KFT8			SVRNAME=kft8				 # 금융결제원_PG망_온라인
KFT9			SVRNAME=kft9				 # 금융결제원_IC 리더폰_온라인
KFTA			SVRNAME=kfta				 # 금융결제원_현금IC구매_온라인
KFTC			SVRNAME=kftc				 # 금융결제원_B2B-B2B전자채권_온라인
KFTD			SVRNAME=kftd				 # 금융결제원_뱅크라인_온라인
KFTE_R			SVRNAME=kfte_r				 # 금융결제원_은행 CMS_파일 수신
KFTE_S			SVRNAME=kfte_s				 # 금융결제원_은행 CMS_파일 송신
#KFTF_R			SVRNAME=kftf_r				 # 금융결제원_CMS_파일 수신
KFTF_S			SVRNAME=kftf_s				 # 금융결제원_CMS_파일 송신
KFTH			SVRNAME=kfth				 # 금융결제원_전자어음_온라인
KFTI			SVRNAME=kfti				 # 금융결제원_인터넷지로_온라인
KFTL			SVRNAME=kftl				 # 금융결제원_CLS(외화동시결제시스템)_온라인
KFTM			SVRNAME=kftm				 # 금융결제원_CMS_온라인
KFTO			SVRNAME=kfto				 # 금융결제원_지역개발공채_온라인
KFTP			SVRNAME=kftp				 # 금융결제원_네트워크론_온라인
KFTQ			SVRNAME=kftq				 # 금융결제원_출국정보조회_온라인
KFTR_R			SVRNAME=kftr_r				 # 결제원 일괄전송 송수신
KFTR_S			SVRNAME=kftr_s				 # 결제원 일괄전송 송수신
KFTS_R			SVRNAME=kfts_r				 # 결제원 일괄전송 송수신
KFTS_S			SVRNAME=kfts_s				 # 결제원 일괄전송 송수신
KFTT			SVRNAME=kftt				 # 금융결제원_지역교육재정_온라인
KFTU			SVRNAME=kftu				 # 금융결제원_국내외화자금이체_온라인
KFTV			SVRNAME=kftv				 # 금융결제원_전자수입인지_온라인
#KFTW			SVRNAME=kftw				 # 금융결제원_신분증진위여부_온라인 : 차세대 오픈 제외
KFB1			SVRNAME=kfb1				 # 은행연합회_신용정보_온라인
KFB2			SVRNAME=kfb2				 # 은행연합회_세금우대_온라인
KFB3			SVRNAME=kfb3				 # 은행연합회_휴면예금_온라인
KFBA_R			SVRNAME=kfba_r				 # 은행연합회_신용정보_파일 수신
KFBA_S			SVRNAME=kfba_s				 # 은행연합회_신용정보_파일 송신
KFBB_R			SVRNAME=kfbb_r				 # 은행연합회_세금우대_파일 수신
KFBB_S			SVRNAME=kfbb_s				 # 은행연합회_세금우대_파일 송신
KFBC_R			SVRNAME=kfbc_r				 # 은행연합회_휴먼예금_파일 수신
KFBC_S			SVRNAME=kfbc_s				 # 은행연합회_휴먼예금_파일 송신
SSB1			SVRNAME=ssb1				 # 서울보증보험_모기지신용보험(MCI)_온라인
SSB2			SVRNAME=ssb2				 # 서울보증보험_신용보증보험_온라인
SSB3			SVRNAME=ssb3				 # 서울보증보험_전세자금보증_온라인
SSB4			SVRNAME=ssb4				 # 서울보증보험_모기지보험(MI)_온라인
SSB5			SVRNAME=ssb5				 # 서울보증보험_우량직장인보험_온라인
CNET			SVRNAME=cnet				 # 청호이지캐쉬(청호컴넷)_제휴CD업무_온라인
EHS1			SVRNAME=ehs1				 # 이지스효성_한국전력가상계좌_온라인
EHSF_R			SVRNAME=ehsf_r				 # 이지스효성_한국전력가상계좌_파일 수신
EHSF_S			SVRNAME=ehsf_s				 # 이지스효성_한국전력가상계좌_파일 송신
KMCO			SVRNAME=kmco				 # 한국자산관리공사_바꿔드림론(BDRL)_온라인
KRI1			SVRNAME=kri1				 # 한국투자증권_증권제휴_온라인
KSD1			SVRNAME=ksd1				 # 한국예탁결제원_펀드판매사이동_온라인
LTC1			SVRNAME=ltc1				 # 롯데카드_전문계카드_온라인
LTC2			SVRNAME=ltc2				 # 롯데카드_LOAN 서비스_온라인
LTC3			SVRNAME=ltc3				 # 롯데카드_체크카드_온라인
MAI1			SVRNAME=mai1				 # 미래에셋증권_증권제휴_온라인 
CCRS			SVRNAME=ccrs                 # 신용회복위원회_학자금전환대출보증_온라인
CCRF_R			SVRNAME=ccrf_r               # 신용회복위원회_학자금전환대출보증_파일수신
CCRF_S			SVRNAME=ccrf_s               # 신용회복위원회_학자금전환대출보증_파일송신
CNS1			SVRNAME=cns1                 # LGCNS_실시간이체_온라인
CNS2			SVRNAME=cns2                 # LG U+_전자금융서버용_온라인
CNS3_R			SVRNAME=cns3_r               # LG U+_CMS_온라인_SERVER
CNS3			SVRNAME=cns3                 # LG U+_CMS_온라인_CLIENT
CNS4			SVRNAME=cns4                 # LG U+_외화서비스_온라인
LGU1			SVRNAME=lgu1                 # LG U+_외화서비스_온라인
CNSF_R			SVRNAME=cnsf_r				 # LGCNS_CMS 배치자료_수신 
CNSF_S			SVRNAME=cnsf_s				 # LGCNS_CMS 배치자료_송신
CNSM_R			SVRNAME=cnsm_r				 # LGCNS_메일박스_파일수신 
CNSM_S			SVRNAME=cnsm_s				 # LGCNS_메일박스_파일송신
HGSM			SVRNAME=hgsm                 # 흥국생명_실시간이체_온라인
HYOS			SVRNAME=hyos                 # 노틸러스효성_제휴CD 업무_온라인
IMC1			SVRNAME=imc1                 # IMC_아파트관리금_온라인_온라인
IMCF_R			SVRNAME=imcf_r               # IMC_아파트관리금_파일 수신
IMCF_S			SVRNAME=imcf_s               # IMC_아파트관리금_파일 송신
INS1			SVRNAME=ins1                 # 이니시스_온라인 
JYSB			SVRNAME=jysb                 # 지역신용보증재단(경남/부산)_전자보증서업무_온라인
MYB1			SVRNAME=myb1                 # 마이비_마이비교통_온라인
MYBF_R			SVRNAME=mybf_r               # 마이비_마이비교통_파일 수신
MYBF_S			SVRNAME=mybf_s               # 마이비_마이비교통_파일 송신
OFC1			SVRNAME=ofc1                 # 한국정책금융공사_온랜딩대출_온라인
OFC1_R			SVRNAME=ofc1_r               # 한국정책금융공사_온랜딩대출_온라인
OFCF_R			SVRNAME=ofcf_r               # 한국정책금융공사_온랜딩대출_파일 수신
OFCF_S			SVRNAME=ofcf_s               # 한국정책금융공사_온랜딩대출_파일 송신
SDS1			SVRNAME=sds1                 # 삼성SDS->삼성생명_실시간이체-삼성생명_온라인
SDS2			SVRNAME=sds2                 # 삼성SDS_실시간이체-펌뱅킹_온라인
SDSM_R			SVRNAME=sdsm_r               # 삼성SDS_메일박스_파일 수신
SDSM_S			SVRNAME=sdsm_s               # 삼성SDS_메일박스_파일 송신
SHC1			SVRNAME=shc1                 # 신한카드_실시간이체_온라인
SHC3			SVRNAME=shc3                 # 신한카드_체크카드_온라인
SHC5			SVRNAME=shc5                 # 신한카드_거래내역통지_온라인
SHC6			SVRNAME=shc6                 # 신한카드_온라인
SHC7			SVRNAME=shc7                 # 신한카드_온라인
SHC8			SVRNAME=shc8                 # 신한카드_온라인
SHI1			SVRNAME=shi1                 # 신한증권_증권제휴
SKCC			SVRNAME=skcc                 # SK 텔레콤_실시간이체
SKCF_R			SVRNAME=skcf_r               # SK 텔레콤_실시간이체_일괄 수신
SKCF_S			SVRNAME=skcf_s               # SK 텔레콤_실시간이체_일괄 송신
SSC1			SVRNAME=ssc1                 # 삼성카드_전문계카드_온라인
SSC2			SVRNAME=ssc2                 # 삼성카드_체크카드_온라인
SSC3			SVRNAME=ssc3                 # 삼성카드_실시간이체-삼성카드_온라인
SSC4			SVRNAME=ssc4                 # 삼성카드_실시간이체(집금)_온라인
SSC5			SVRNAME=ssc5                 # 삼성카드_실시간이체(집금)_온라인
STB1			SVRNAME=stb1                 # 세틀뱅크_실시간이체_온라인
STB2			SVRNAME=stb2                 # 세틀뱅크_가상계좌 및 거래내역 통지_온라인
STBF_R			SVRNAME=stbf_r               # 세틀뱅크_일괄 수신
STBF_S			SVRNAME=stbf_s               # 세틀뱅크_일괄 송신
WWM1			SVRNAME=wwm1                 # 우리투자증권_담보유가증권_온라인
WWM2			SVRNAME=wwm2                 # 우리투자증권_경남지역채권_온라인
WWM3			SVRNAME=wwm3                 # 우리투자증권_증권제휴_온라인
WWMA_R			SVRNAME=wwma_r               # 우리투자증권_담보유가증권_파일수신
WWMA_S			SVRNAME=wwma_s               # 우리투자증권_다모유가증권_파일송신
WWMF_R			SVRNAME=wwmf_r               # 우리투자증권_지역개발채권_파일수신
WWMF_S			SVRNAME=wwmf_s               # 우리투자증권_지역개발채권_파일송신
FSA1            SVRNAME=fsa1                 # 금융보안연구원_OTP카드_온라인
FSA2            SVRNAME=fsa2                 # 금융보안연구원_OTP카드_온라인
SSF0            SVRNAME=ssf0                 # 삼성화재_실시간이체_온라인
SSI1            SVRNAME=ssi1                 # 삼성증권_증권제휴_온라인 
ECB1            SVRNAME=ecb1                 # EC뱅크_전자어음-현대자동차 위아_온라인
ECB2            SVRNAME=ecb2                 # EC뱅크_외화자금이체_온라인
ECB4            SVRNAME=ecb4                 # EC뱅크_가상계좌및 실시간이체_온라인
ECBF_R          SVRNAME=ecbf_r               # EC뱅크_배치 수신
ECBF_S          SVRNAME=ecbf_s               # EC뱅크_배치 송신
KHGC            SVRNAME=khgc                 # 대한주택보증_전세자금보증_온라인
KHGF_R          SVRNAME=khgf_r               # 대한주택보증_전세자금보증_일괄 수신
KHGF_S          SVRNAME=khgf_s               # 대한주택보증_전세자금보증_일괄 송신
LIG1            SVRNAME=lig1                 # LIG 손해보험_전세자금대출_온라인
KAIT            SVRNAME=kait                 # 한국정보통신산업협회_외국인정보인증_온라인
KAP1            SVRNAME=kap1                 # 한국감정평가협회_온라인
KCB1            SVRNAME=kcb1                 # KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_온라인
KCB3            SVRNAME=kcb3                 # KCB(코리아크레딧뷰로)_신도로명주소_온라인
KCB2_R          SVRNAME=kcb2_r               # KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_파일수신
KCB2_S          SVRNAME=kcb2_s               # KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_파일송신
KCBF_S          SVRNAME=kcbf_s               # KCB(코리아크레딧뷰로)_여신조회업무(신용평가)_파일송신
KED4            SVRNAME=ked4                 # KED(한국기업데이타)_연체정보공유망(CB정보조회)_온라인
KED1_R          SVRNAME=ked1_r               # KED(한국기업데이타)_연체정보 외_파일 수신
KED3_R          SVRNAME=ked3_r               # KED(한국기업데이타)_KEB 정보조회_파일 수신
KED3_S          SVRNAME=ked3_s               # KED(한국기업데이타)_KEB 정보조회_파일 송신
MCP1            SVRNAME=mcp1                 # 하렉스인포텍_모카페이_온라인
TAT1            SVRNAME=tat1                 # 씽크에이티_투채널인증_온라인
WCH1            SVRNAME=wch1                 # 웹캐시_연구비통합관리_온라인
WCH2            SVRNAME=wch2                 # BGF캐시넷_제휴CD 업무_온라인
WCH3            SVRNAME=wch3                 # 웹캐시_가상계좌_온라인
WCH4            SVRNAME=wch4                 # 웹캐시_전자어음_온라인
WCH5            SVRNAME=wch5                 # 웹캐시_기업CMS_온라인
WCHF_ADT        SVRNAME=wchf_adt             # 웹캐시_가상계좌_가상 어뎁터
WCHF_R          SVRNAME=wchf_r               # 웹캐시_가상계좌_파일 수신
WCHF_S          SVRNAME=wchf_s               # 웹캐시_가상계좌_파일 송신
HNET            SVRNAME=hnet                 # HANNET_제휴CD 업무_온라인
HNE1			SVRNAME=hne1				 # HANNET_운영자금청구_온라인
KIS1            SVRNAME=kis1                 # KISBANK_제휴CD 업무_온라인
WRC1            SVRNAME=wrc1                 # 우리카드_아이사랑체크결재_온라인
DOC1            SVRNAME=doc1                 # 경남에너지_도시가스납부_온라인
DSI1            SVRNAME=dsi1                 # 대신증권_증권제휴_온라인
DST1            SVRNAME=dst1                 # IMC_동서TMS(펌뱅킹)_온라인
DSTF_R          SVRNAME=dstf_r               # IMC_동서TMS_파일 수신 
DSTF_S          SVRNAME=dstf_s               # IMC_동서TMS_파일 송신
BOK1            SVRNAME=bok1                 # 한국은행_외환_온라인
BOKO            SVRNAME=boko                 # 한국은행_국고_온라인
BOK2            SVRNAME=bok2                 # 한국은행_신한은망_온라인 : 차세대 오픈 제외
BOKA_R          SVRNAME=boka_r               # 한국은행_국고_파일 수신
BOKA_S          SVRNAME=boka_s               # 한국은행_국고_파일 송신
BOKB_R          SVRNAME=bokb_r               # 한국은행_외환_파일 수신
BOKB_S          SVRNAME=bokb_s               # 한국은행_외환_파일 송신
BOKF_R          SVRNAME=bokf_r               # 한국은행_신한은망_파일 수신
BOKF_S          SVRNAME=bokf_s               # 한국은행_신한은망_파일 송신

# 암복호화 테스트
TEST_SEED            SVRNAME=test_seed
SONG				 SVRNAME=song
################################################################################
#	SERVICE - 일괄 Adaptor service
################################################################################
# REAL : 일괄 Adaptor	###################################


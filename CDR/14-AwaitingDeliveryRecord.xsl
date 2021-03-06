<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Liquid Studio 2017 - Developer Bundle Edition (Trial) 15.1.4.7515 (https://www.liquid-technologies.com) -->
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:include href="CDA-Support-Files/Export/Common/OIDs-IOT.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Common/CDAHeader1.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Common/Body.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Common/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Entry-Modules/ChiefComplaint.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Entry-Modules/TreatmentPlan.xsl"/>
<<<<<<< HEAD
	<!--xsl:include href="CDA-Support-Files/Export/Entry-Modules/LaboratoryExamination.xsl"/-->
	<xsl:include href="CDA-Support-Files/Export/Section-Modules/Diagnosis.xsl"/>
	<xsl:include href="CDA-Support-Files/Export/Section-Modules/Medication.xsl"/>
=======
	<!--xsl:include href="CDA-Support-Files/Export/Section-Modules/Diagnosis.xsl"/-->
>>>>>>> 12a402f3817ecedeefc4f4e4cf3a5f471691e749
	<!--xsl:include href="CDA-Support-Files/Export/Section-Modules/Encounter.xsl"/-->
	<xsl:template match="/Document">
		<ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3">
			<xsl:apply-templates select="." mode="CDAHeader"/>
			<xsl:comment>病人信息</xsl:comment>
			<recordTarget contextControlCode="OP" typeCode="RCT">
				<patientRole classCode="PAT">
					<!-- 住院号标识 -->
					<xsl:apply-templates select="Encounter/Patient" mode="InpatientID"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者身份证号-->
						<xsl:apply-templates select="Encounter/Patient" mode="IDNo"/>
						<xsl:apply-templates select="Encounter/Patient" mode="Name"/>
						<xsl:apply-templates select="Encounter/Patient" mode="Gender"/>
						<!--xsl:apply-templates select="Encounter/Patient" mode="BirthTime"/-->
						<xsl:apply-templates select="Encounter/Patient" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Author" mode="Author1"/>
			<!-- 保管机构 -->
			<xsl:apply-templates select="Custodian" mode="Custodian"/>
			<!--产程检查者签名-->
			<xsl:comment>产程检查者签名</xsl:comment>
			<xsl:apply-templates select="Practitioners/Practitioner[PractitionerRole='产程检查者']" mode="Authenticator"/>
			<!--记录人签名-->
			<xsl:comment>记录人签名</xsl:comment>
			<xsl:apply-templates select="Practitioners/Practitioner[PractitionerRole='记录人']" mode="Authenticator"/>
			<xsl:apply-templates select="Linkman" mode="Linkman"/>
			<!--participant typeCode="NOT"-->
			<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
			<!--associatedEntity classCode="ECON"-->
			<!--联系人电话-->
			<!--telecom value="13811383400"/-->
			<!--联系人-->
			<!--associatedPerson-->
			<!--姓名-->
			<!--name>刘佳</name>
			    </associatedPerson>
		    </associatedEntity>
	        </participant-->
			<!--相关文档，暂时不用-->
			<xsl:call-template name="relatedDocument"/>
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<xsl:apply-templates select="Encounter" mode="Hosipitalization1"/>
			</componentOf>
			<!--文档体-->
			<component>
				<structuredBody>
					<!--主要健康问题章节-->
					<xsl:comment>主要健康问题章节</xsl:comment>
					<component>
						<section>
							<code code="11450-4" displayName="Problem list" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<!--待产日期时间 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem3"/>
							<!--孕次 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem4"/>
							<!--产次 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem5"/>
							<!--末次月经日期 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem6"/>
							<!--孕次形式代码 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem7"/>
							<!--预产期-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem8"/>
							<!--产前检查标志 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem9"/>
							<!--产前检查异常情况 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem10"/>
							<!--此次妊娠特殊情况 1..1 R-->
							<xsl:apply-templates select="HealthProblem" mode="HealthProblem11"/>
						</section>
					</component>
					<!--生命体征章节-->
					<xsl:comment>生命体征章节</xsl:comment>
					<component>
						<section>
							<code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<!--孕前体重 1..1 R2-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign11"/>
							<!--身高 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign13"/>
							<!--产前体重 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign12"/>
							<!--血压条目 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign6"/>
							<!--体温 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign2"/>
							<!--脉率 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign3"/>
							<!--呼吸频率 1..1 R-->
							<xsl:apply-templates select="VitalSign" mode="VitalSign4"/>
						</section>
					</component>
					<!--既往史章节-->
					<xsl:comment>既往史章节</xsl:comment>
					<component>
						<section>
							<code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<!--既往史 0..* R2-->
							<xsl:apply-templates select="Encounter/Patient/IllnessHistories" mode="Surgery"/>
							<!--手术史 0..* R2-->
							<xsl:apply-templates select="Encounter/Patient/IllnessHistories" mode="Past"/>
							<!--既往孕产史 0..* R2-->
							<xsl:apply-templates select="Encounter/Patient/IllnessHistories" mode="Pregnancy"/>
						</section>
					</component>
					<!--产前检查章节-->
					<xsl:comment>产前检查章节</xsl:comment>
					<component>
						<section>
<<<<<<< HEAD
							<code code="57073-9" displayName="Prenatal events" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<xsl:apply-templates select="PrenatalExamination" mode="PrenatalExamination"/>
=======
							<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--宫底高度 1..1 R-->
							<xsl:apply-templates select="Sections/Section[SectionCode='DE05.01.025.00']" mode="TreatmentPlanEntry"/>
							<!--腹围 1..1 R-->
							<xsl:apply-templates select="Sections/Section[SectionCode='DE06.00.300.00']" mode="TreatmentPlanEntry"/>
							<!--胎方位代码 1..1 R-->
							<xsl:apply-templates select="Sections/Section[SectionCode='DE05.01.025.00']" mode="TreatmentPlanEntry"/>
>>>>>>> 12a402f3817ecedeefc4f4e4cf3a5f471691e749
						</section>
					</component>
					<!--处置计划章节-->
					<xsl:comment>处置计划章节</xsl:comment>
					<component>
						<section>
							<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<!--处置计划 1..1 R-->
							<xsl:apply-templates select="DisposalPlan" mode="DPlan1"/>
							<!--计划选取的分娩方式 1..1 R-->
							<xsl:apply-templates select="DisposalPlan" mode="DPlan2"/>
							<!--产程记录日期时间 1..1 R-->
							<xsl:apply-templates select="DisposalPlan" mode="DPlan3"/>
							<!--产程经过 1..1 R-->
							<xsl:apply-templates select="DisposalPlan" mode="DPlan4"/>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->

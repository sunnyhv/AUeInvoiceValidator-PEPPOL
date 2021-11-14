<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:sch="http://purl.oclc.org/dsdl/schematron"
               xmlns:error="https://doi.org/10.5281/zenodo.1495494#error"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:schxslt-api="https://doi.org/10.5281/zenodo.1495494#api"
               xmlns:schxslt="https://doi.org/10.5281/zenodo.1495494"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
               xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
               xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
               xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"
               xmlns:udt="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"
               xmlns:cn="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
               xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
               version="2.0">
   <rdf:Description xmlns:dct="http://purl.org/dc/terms/"
                    xmlns:dc="http://purl.org/dc/elements/1.1/"
                    xmlns:skos="http://www.w3.org/2004/02/skos/core#">
      <dct:creator>
         <dct:Agent>
            <skos:prefLabel>SchXslt/1.8.2 SAXON/HE 9.9.1.5</skos:prefLabel>
            <schxslt.compile.typed-variables xmlns="https://doi.org/10.5281/zenodo.1495494#">true</schxslt.compile.typed-variables>
         </dct:Agent>
      </dct:creator>
      <dct:created>2021-09-22T11:48:47.996+10:00</dct:created>
   </rdf:Description>
   <xsl:output indent="yes"/>
   <xsl:template match="/">
      <xsl:variable name="metadata" as="element()?">
         <svrl:metadata xmlns:dct="http://purl.org/dc/terms/"
                        xmlns:skos="http://www.w3.org/2004/02/skos/core#"
                        xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
            <dct:creator>
               <dct:Agent>
                  <skos:prefLabel>
                     <xsl:variable name="prefix"
                                   as="xs:string?"
                                   select="if (doc-available('')) then in-scope-prefixes(document('')/*[1])[namespace-uri-for-prefix(., document('')/*[1]) eq 'http://www.w3.org/1999/XSL/Transform'][1] else ()"/>
                     <xsl:choose>
                        <xsl:when test="empty($prefix)">Unknown</xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of separator="/"
                                         select="(system-property(concat($prefix, ':product-name')), system-property(concat($prefix,':product-version')))"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </skos:prefLabel>
               </dct:Agent>
            </dct:creator>
            <dct:created>
               <xsl:value-of select="current-dateTime()"/>
            </dct:created>
            <dct:source>
               <rdf:Description xmlns:dc="http://purl.org/dc/elements/1.1/">
                  <dct:creator>
                     <dct:Agent>
                        <skos:prefLabel>SchXslt/1.8.2 SAXON/HE 9.9.1.5</skos:prefLabel>
                        <schxslt.compile.typed-variables xmlns="https://doi.org/10.5281/zenodo.1495494#">true</schxslt.compile.typed-variables>
                     </dct:Agent>
                  </dct:creator>
                  <dct:created>2021-09-22T11:48:47.996+10:00</dct:created>
               </rdf:Description>
            </dct:source>
         </svrl:metadata>
      </xsl:variable>
      <xsl:variable name="report" as="element(schxslt:report)">
         <schxslt:report>
            <xsl:call-template name="d12e29"/>
         </schxslt:report>
      </xsl:variable>
      <xsl:variable name="schxslt:report" as="node()*">
         <xsl:sequence select="$metadata"/>
         <xsl:for-each select="$report/schxslt:document">
            <xsl:for-each select="schxslt:pattern">
               <xsl:sequence select="node()"/>
               <xsl:sequence select="../schxslt:rule[@pattern = current()/@id]/node()"/>
            </xsl:for-each>
         </xsl:for-each>
      </xsl:variable>
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
         <svrl:ns-prefix-in-attribute-values prefix="ext"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="cbc"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="cac"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="qdt"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="udt"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="cn"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="ubl"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
         <xsl:sequence select="$schxslt:report"/>
      </svrl:schematron-output>
   </xsl:template>
   <xsl:template match="text() | @*" mode="#all" priority="-10"/>
   <xsl:template match="*" mode="#all" priority="-10">
      <xsl:apply-templates mode="#current" select="@*"/>
      <xsl:apply-templates mode="#current" select="node()"/>
   </xsl:template>
   <xsl:template name="d12e29">
      <schxslt:document>
         <schxslt:pattern id="d12e29">
            <xsl:if test="exists(base-uri(/))">
               <xsl:attribute name="documents" select="base-uri(/)"/>
            </xsl:if>
            <xsl:for-each select="/">
               <svrl:active-pattern xmlns:svrl="http://purl.oclc.org/dsdl/svrl" id="UBL-model">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <schxslt:pattern id="d12e600">
            <xsl:if test="exists(base-uri(/))">
               <xsl:attribute name="documents" select="base-uri(/)"/>
            </xsl:if>
            <xsl:for-each select="/">
               <svrl:active-pattern xmlns:svrl="http://purl.oclc.org/dsdl/svrl" id="UBL-syntax">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <schxslt:pattern id="d12e3009">
            <xsl:if test="exists(base-uri(/))">
               <xsl:attribute name="documents" select="base-uri(/)"/>
            </xsl:if>
            <xsl:for-each select="/">
               <svrl:active-pattern xmlns:svrl="http://purl.oclc.org/dsdl/svrl" id="Codesmodel">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <xsl:apply-templates mode="d12e29" select="/"/>
      </schxslt:document>
   </xsl:template>
   <xsl:template match="cac:AdditionalDocumentReference" priority="82" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AdditionalDocumentReference" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cbc:ID) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-52">
                     <xsl:attribute name="test">(cbc:ID) != ''</xsl:attribute>
                     <svrl:text>[BR-52]-Each Additional supporting document (BG-24) shall contain a Supporting document reference (BT-122).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount"
                 priority="81"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((. &gt; 0) and (exists(//cbc:DueDate) or exists(//cac:PaymentTerms/cbc:Note))) or (. &lt;= 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-25">
                     <xsl:attribute name="test">((. &gt; 0) and (exists(//cbc:DueDate) or exists(//cac:PaymentTerms/cbc:Note))) or (. &lt;= 0)</xsl:attribute>
                     <svrl:text>[BR-CO-25]-In case the Amount due for payment (BT-115) is positive, either the Payment due date (BT-9) or the Payment terms (BT-20) shall be present.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID"
                 priority="80"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AccountingCustomerParty/cac:Party/cbc:EndpointID" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingCustomerParty/cac:Party/cbc:EndpointID</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingCustomerParty/cac:Party/cbc:EndpointID</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-63">
                     <xsl:attribute name="test">exists(@schemeID)</xsl:attribute>
                     <svrl:text>[BR-63]-The Buyer electronic address (BT-49) shall have a Scheme identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress"
                 priority="79"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AccountingCustomerParty/cac:Party/cac:PostalAddress" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingCustomerParty/cac:Party/cac:PostalAddress</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingCustomerParty/cac:Party/cac:PostalAddress</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cac:Country/cbc:IdentificationCode) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-11">
                     <xsl:attribute name="test">(cac:Country/cbc:IdentificationCode) != ''</xsl:attribute>
                     <svrl:text>[BR-11]-The Buyer postal address shall contain a Buyer country code (BT-55).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PaymentMeans/cac:CardAccount"
                 priority="78"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentMeans/cac:CardAccount" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans/cac:CardAccount</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans/cac:CardAccount</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(string-length(cbc:PrimaryAccountNumberID)&gt;=4 and string-length(cbc:PrimaryAccountNumberID)&lt;=6)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-51">
                     <xsl:attribute name="test">string-length(cbc:PrimaryAccountNumberID)&gt;=4 and string-length(cbc:PrimaryAccountNumberID)&lt;=6</xsl:attribute>
                     <svrl:text>[BR-51]-The last 4 to 6 digits of the Payment card primary account number (BT-87) shall be present if Payment card information (BG-18) is provided in the Invoice.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:Delivery/cac:DeliveryLocation/cac:Address"
                 priority="77"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:Delivery/cac:DeliveryLocation/cac:Address" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Delivery/cac:DeliveryLocation/cac:Address</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Delivery/cac:DeliveryLocation/cac:Address</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cac:Country/cbc:IdentificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-57">
                     <xsl:attribute name="test">exists(cac:Country/cbc:IdentificationCode)</xsl:attribute>
                     <svrl:text>[BR-57]-Each Deliver to address (BG-15) shall contain a Deliver to country code (BT-80).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]"
                 priority="76"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:Amount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-31">
                     <xsl:attribute name="test">exists(cbc:Amount)</xsl:attribute>
                     <svrl:text>[BR-31]-Each Document level allowance (BG-20) shall have a Document level allowance amount (BT-92).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-32-AUNZ">
                     <xsl:attribute name="test">exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID)</xsl:attribute>
                     <svrl:text>[BR-32-AUNZ]-Each Document level allowance (BG-20) shall have a Document level allowance Tax category code (BT-95).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-33">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-33]-Each Document level allowance (BG-20) shall have a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-21">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-CO-21]-Each Document level allowance (BG-20) shall contain a Document level allowance reason (BT-97) or a Document level allowance reason code (BT-98), or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:Amount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-01">
                     <xsl:attribute name="test">string-length(substring-after(cbc:Amount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-01]-The allowed maximum number of decimals for the Document level allowance amount (BT-92) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-02">
                     <xsl:attribute name="test">string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-02]-The allowed maximum number of decimals for the Document level allowance base amount (BT-93) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]"
                 priority="75"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:Amount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-36">
                     <xsl:attribute name="test">exists(cbc:Amount)</xsl:attribute>
                     <svrl:text>[BR-36]-Each Document level charge (BG-21) shall have a Document level charge amount (BT-99).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-37-AUNZ">
                     <xsl:attribute name="test">exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID)</xsl:attribute>
                     <svrl:text>[BR-37-AUNZ]-Each Document level charge (BG-21) shall have a Document level charge Tax category code (BT-102).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-38">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-38]-Each Document level charge (BG-21) shall have a Document level charge reason (BT-104) or a Document level charge reason code (BT-105).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-22">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-CO-22]-Each Document level charge (BG-21) shall contain a Document level charge reason (BT-104) or a Document level charge reason code (BT-105), or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:Amount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-05">
                     <xsl:attribute name="test">string-length(substring-after(cbc:Amount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-05]-The allowed maximum number of decimals for the Document level charge amount (BT-99) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-06">
                     <xsl:attribute name="test">string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-06]-The allowed maximum number of decimals for the Document level charge base amount (BT-100) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:LegalMonetaryTotal" priority="74" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:LegalMonetaryTotal" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:LegalMonetaryTotal</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:LegalMonetaryTotal</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:LineExtensionAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-12">
                     <xsl:attribute name="test">exists(cbc:LineExtensionAmount)</xsl:attribute>
                     <svrl:text>[BR-12]-An Invoice shall have the Sum of Invoice line net amount (BT-106).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:TaxExclusiveAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-13-AUNZ">
                     <xsl:attribute name="test">exists(cbc:TaxExclusiveAmount)</xsl:attribute>
                     <svrl:text>[BR-13-AUNZ]-An Invoice shall have the Invoice total amount without Tax (BT-109).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:TaxInclusiveAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-14-AUNZ">
                     <xsl:attribute name="test">exists(cbc:TaxInclusiveAmount)</xsl:attribute>
                     <svrl:text>[BR-14-AUNZ]-An Invoice shall have the Invoice total amount with Tax (BT-112).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:PayableAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-15">
                     <xsl:attribute name="test">exists(cbc:PayableAmount)</xsl:attribute>
                     <svrl:text>[BR-15]-An Invoice shall have the Amount due for payment (BT-115).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((xs:decimal(cbc:LineExtensionAmount) = xs:decimal(round(sum(//(cac:InvoiceLine|cac:CreditNoteLine)/xs:decimal(cbc:LineExtensionAmount)) * 10 * 10) div 100)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-10">
                     <xsl:attribute name="test">(xs:decimal(cbc:LineExtensionAmount) = xs:decimal(round(sum(//(cac:InvoiceLine|cac:CreditNoteLine)/xs:decimal(cbc:LineExtensionAmount)) * 10 * 10) div 100))</xsl:attribute>
                     <svrl:text>[BR-CO-10]-Sum of Invoice line net amount (BT-106) = Σ Invoice line net amount (BT-131).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(cbc:AllowanceTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=false()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or  (not(cbc:AllowanceTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=false()])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-11">
                     <xsl:attribute name="test">xs:decimal(cbc:AllowanceTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=false()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or  (not(cbc:AllowanceTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=false()]))</xsl:attribute>
                     <svrl:text>[BR-CO-11]-Sum of allowances on document level (BT-107) = Σ Document level allowance amount (BT-92).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(cbc:ChargeTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=true()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or (not(cbc:ChargeTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=true()])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-12">
                     <xsl:attribute name="test">xs:decimal(cbc:ChargeTotalAmount) = (round(sum(../cac:AllowanceCharge[cbc:ChargeIndicator=true()]/xs:decimal(cbc:Amount)) * 10 * 10) div 100) or (not(cbc:ChargeTotalAmount) and not(../cac:AllowanceCharge[cbc:ChargeIndicator=true()]))</xsl:attribute>
                     <svrl:text>[BR-CO-12]-Sum of charges on document level (BT-108) = Σ Document level charge amount (BT-99).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = xs:decimal(cbc:LineExtensionAmount))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-13-AUNZ">
                     <xsl:attribute name="test">((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) - xs:decimal(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = round((xs:decimal(cbc:LineExtensionAmount) + xs:decimal(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (xs:decimal(cbc:TaxExclusiveAmount) = xs:decimal(cbc:LineExtensionAmount)))</xsl:attribute>
                     <svrl:text>[BR-CO-13-AUNZ]-Invoice total amount without Tax (BT-109) = Σ Invoice line net amount (BT-131) - Sum of allowances on document level (BT-107) + Sum of charges on document level (BT-108).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cbc:PrepaidAmount) and not(exists(cbc:PayableRoundingAmount)) and (xs:decimal(cbc:PayableAmount) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or (not(exists(cbc:PrepaidAmount)) and not(exists(cbc:PayableRoundingAmount)) and xs:decimal(cbc:PayableAmount) = xs:decimal(cbc:TaxInclusiveAmount)) or (exists(cbc:PrepaidAmount) and exists(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or  (not(exists(cbc:PrepaidAmount)) and exists(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = xs:decimal(cbc:TaxInclusiveAmount))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-16-AUNZ">
                     <xsl:attribute name="test">(exists(cbc:PrepaidAmount) and not(exists(cbc:PayableRoundingAmount)) and (xs:decimal(cbc:PayableAmount) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or (not(exists(cbc:PrepaidAmount)) and not(exists(cbc:PayableRoundingAmount)) and xs:decimal(cbc:PayableAmount) = xs:decimal(cbc:TaxInclusiveAmount)) or (exists(cbc:PrepaidAmount) and exists(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = (round((xs:decimal(cbc:TaxInclusiveAmount) - xs:decimal(cbc:PrepaidAmount)) * 10 * 10) div 100))) or  (not(exists(cbc:PrepaidAmount)) and exists(cbc:PayableRoundingAmount) and ((round((xs:decimal(cbc:PayableAmount) - xs:decimal(cbc:PayableRoundingAmount)) * 10 * 10) div 100) = xs:decimal(cbc:TaxInclusiveAmount)))</xsl:attribute>
                     <svrl:text>[BR-CO-16-AUNZ]-Amount due for payment (BT-115) = Invoice total amount with tax (BT-112) -Paid amount (BT-113) +Rounding amount (BT-114).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:LineExtensionAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-09">
                     <xsl:attribute name="test">string-length(substring-after(cbc:LineExtensionAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-09]-The allowed maximum number of decimals for the Sum of Invoice line net amount (BT-106) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:AllowanceTotalAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-10">
                     <xsl:attribute name="test">string-length(substring-after(cbc:AllowanceTotalAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-10]-The allowed maximum number of decimals for the Sum of allowanced on document level (BT-107) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:ChargeTotalAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-11">
                     <xsl:attribute name="test">string-length(substring-after(cbc:ChargeTotalAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-11]-The allowed maximum number of decimals for the Sum of charges on document level (BT-108) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:TaxExclusiveAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-12-AUNZ">
                     <xsl:attribute name="test">string-length(substring-after(cbc:TaxExclusiveAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-12-AUNZ]-The allowed maximum number of decimals for the Invoice total amount without tax (BT-109) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:TaxInclusiveAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-14-AUNZ">
                     <xsl:attribute name="test">string-length(substring-after(cbc:TaxInclusiveAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-14-AUNZ]-The allowed maximum number of decimals for the Invoice total amount with tax (BT-112) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:PrepaidAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-16">
                     <xsl:attribute name="test">string-length(substring-after(cbc:PrepaidAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-16]-The allowed maximum number of decimals for the Paid amount (BT-113) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:PayableRoundingAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-17">
                     <xsl:attribute name="test">string-length(substring-after(cbc:PayableRoundingAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-17]-The allowed maximum number of decimals for the Rounding amount (BT-114) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:PayableAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-18">
                     <xsl:attribute name="test">string-length(substring-after(cbc:PayableAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-18]-The allowed maximum number of decimals for the Amount due for payment (BT-115) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice | /cn:CreditNote" priority="73" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice | /cn:CreditNote" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice | /cn:CreditNote</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice | /cn:CreditNote</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cbc:CustomizationID) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-01">
                     <xsl:attribute name="test">(cbc:CustomizationID) != ''</xsl:attribute>
                     <svrl:text>[BR-01]-An Invoice shall have a Specification identifier (BT-24).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cbc:ID) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-02">
                     <xsl:attribute name="test">(cbc:ID) !=''</xsl:attribute>
                     <svrl:text>[BR-02]-An Invoice shall have an Invoice number (BT-1).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cbc:IssueDate) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-03">
                     <xsl:attribute name="test">(cbc:IssueDate) !=''</xsl:attribute>
                     <svrl:text>[BR-03]-An Invoice shall have an Invoice issue date (BT-2).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cbc:InvoiceTypeCode) !='' or (cbc:CreditNoteTypeCode) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-04">
                     <xsl:attribute name="test">(cbc:InvoiceTypeCode) !='' or (cbc:CreditNoteTypeCode) !=''</xsl:attribute>
                     <svrl:text>[BR-04]-An Invoice shall have an Invoice type code (BT-3).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cbc:DocumentCurrencyCode) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-05">
                     <xsl:attribute name="test">(cbc:DocumentCurrencyCode) !=''</xsl:attribute>
                     <svrl:text>[BR-05]-An Invoice shall have an Invoice currency code (BT-5).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-06">
                     <xsl:attribute name="test">(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !=''</xsl:attribute>
                     <svrl:text>[BR-06]-An Invoice shall contain the Seller name (BT-27).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !='')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-07">
                     <xsl:attribute name="test">(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) !=''</xsl:attribute>
                     <svrl:text>[BR-07]-An Invoice shall contain the Buyer name (BT-44).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-08">
                     <xsl:attribute name="test">exists(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress)</xsl:attribute>
                     <svrl:text>[BR-08]-An Invoice shall contain the Seller postal address. </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-10">
                     <xsl:attribute name="test">exists(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress)</xsl:attribute>
                     <svrl:text>[BR-10]-An Invoice shall contain the Buyer postal address (BG-8).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:InvoiceLine) or exists(cac:CreditNoteLine))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-16">
                     <xsl:attribute name="test">exists(cac:InvoiceLine) or exists(cac:CreditNoteLine)</xsl:attribute>
                     <svrl:text>[BR-16]-An Invoice shall have at least one Invoice line (BG-25)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(every $taxcurrency in cbc:TaxCurrencyCode satisfies exists(//cac:TaxTotal/cbc:TaxAmount[@currencyID=$taxcurrency]))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-53-AUNZ">
                     <xsl:attribute name="test">every $taxcurrency in cbc:TaxCurrencyCode satisfies exists(//cac:TaxTotal/cbc:TaxAmount[@currencyID=$taxcurrency])</xsl:attribute>
                     <svrl:text>[BR-53-AUNZ]-If the Tax accounting currency code (BT-6) is present, then the Invoice total Tax amount in accounting currency (BT-111) shall be provided.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:PaymentMeans/cac:CardAccount) &lt;= 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-66">
                     <xsl:attribute name="test">count(cac:PaymentMeans/cac:CardAccount) &lt;= 1</xsl:attribute>
                     <svrl:text>[BR-66]-An Invoice shall contain maximum one Payment Card account (BG-18).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:PaymentMeans/cac:PaymentMandate) &lt;= 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-67">
                     <xsl:attribute name="test">count(cac:PaymentMeans/cac:PaymentMandate) &lt;= 1</xsl:attribute>
                     <svrl:text>[BR-67]-An Invoice shall contain maximum one Payment Mandate (BG-19).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and exists(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-03-AUNZ">
                     <xsl:attribute name="test">(exists(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and exists(cac:InvoicePeriod/cbc:DescriptionCode)) or (not(cbc:TaxPointDate) and not(cac:InvoicePeriod/cbc:DescriptionCode))</xsl:attribute>
                     <svrl:text>[BR-CO-03-AUNZ]-Tax point date (BT-7) and tax point date code (BT-8) are mutually exclusive.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(every $Currency in cbc:DocumentCurrencyCode satisfies (count(//cac:TaxTotal/xs:decimal(cbc:TaxAmount[@currencyID=$Currency])) eq 1) and (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxInclusiveAmount) = round( (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxExclusiveAmount) + cac:TaxTotal/xs:decimal(cbc:TaxAmount[@currencyID=$Currency])) * 10 * 10) div 100))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-15-AUNZ">
                     <xsl:attribute name="test">every $Currency in cbc:DocumentCurrencyCode satisfies (count(//cac:TaxTotal/xs:decimal(cbc:TaxAmount[@currencyID=$Currency])) eq 1) and (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxInclusiveAmount) = round( (cac:LegalMonetaryTotal/xs:decimal(cbc:TaxExclusiveAmount) + cac:TaxTotal/xs:decimal(cbc:TaxAmount[@currencyID=$Currency])) * 10 * 10) div 100)</xsl:attribute>
                     <svrl:text>[BR-CO-15-AUNZ]-Invoice total amount with tax (BT-112) = Invoice total amount without tax (BT-109) + Invoice total tax amount (BT-110).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:TaxTotal/cac:TaxSubtotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-18-AUNZ">
                     <xsl:attribute name="test">exists(cac:TaxTotal/cac:TaxSubtotal)</xsl:attribute>
                     <svrl:text>[BR-CO-18-AUNZ]-An Invoice shall at least have one tax breakdown group (BG-23).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-13-AUNZ">
                     <xsl:attribute name="test">(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:DocumentCurrencyCode]))</xsl:attribute>
                     <svrl:text>[BR-DEC-13-AUNZ]-The allowed maximum number of decimals for the Invoice total Tax amount (BT-110) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-15-AUNZ">
                     <xsl:attribute name="test">(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode] and (string-length(substring-after(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode],'.'))&lt;=2)) or (not(//cac:TaxTotal/cbc:TaxAmount[@currencyID = cbc:TaxCurrencyCode]))</xsl:attribute>
                     <svrl:text>[BR-DEC-15-AUNZ]-The allowed maximum number of decimals for the Invoice total Tax amount in accounting currency (BT-111) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E'])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-01-AUNZ">
                     <xsl:attribute name="test">((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'E']))</xsl:attribute>
                     <svrl:text>[BR-E-01-AUNZ]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the Tax category code (BT-151, BT-95 or BT-102) is "Exempt from tax" shall contain exactly one Tax breakdown (BG-23) with the Tax category code (BT-118) equal to "Exempt from Tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G'])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-01-AUNZ">
                     <xsl:attribute name="test">((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'G']))</xsl:attribute>
                     <svrl:text>[BR-G-01-AUNZ]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the Tax category code (BT-151, BT-95 or BT-102) is "G - Free export item, tax not charged" shall contain in the Tax subtotal (BG-23) exactly one Tax category code (BT-118) equal with "G - Free export item, tax not charged".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-01-AUNZ">
                     <xsl:attribute name="test">((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']))</xsl:attribute>
                     <svrl:text>[BR-O-01-AUNZ]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the Tax category code (BT-151, BT-95 or BT-102) is "Services outside scope of tax" shall contain exactly one Tax breakdown group (BG-23) with the Tax category code (BT-118) equal to "Services outside scope of tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-11-AUNZ">
                     <xsl:attribute name="test">(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])</xsl:attribute>
                     <svrl:text>[BR-O-11-AUNZ]-An Invoice that contains a Tax breakdown group (BG-23) with a Tax category code (BT-118) "Services outside scope of tax" shall not contain other Tax breakdown groups (BG-23).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-12-AUNZ">
                     <xsl:attribute name="test">(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])</xsl:attribute>
                     <svrl:text>[BR-O-12-AUNZ]-An Invoice that contains a Tax breakdown group (BG-23) with a Tax category code (BT-118) "Services outside scope of tax" shall not contain an Invoice line (BG-25) where the Invoiced item Tax category code (BT-151) is not "Services outside scope of tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-13-AUNZ">
                     <xsl:attribute name="test">(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])</xsl:attribute>
                     <svrl:text>[BR-O-13-AUNZ]-An Invoice that contains a Tax breakdown group (BG-23) with a Tax category code (BT-118) "Services outside scope of tax" shall not contain Document level allowances (BG-20) where Document level allowance Tax category code (BT-95) is not "Services outside scope of tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-14-AUNZ">
                     <xsl:attribute name="test">(exists(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O']) and count(//cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID) != 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']) = 0) or not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'O'])</xsl:attribute>
                     <svrl:text>[BR-O-14-AUNZ]-An Invoice that contains a Tax breakdown group (BG-23) with a Tax category code (BT-118) "Services outside scope of tax" shall not contain Document level charges (BG-21) where Document level charge Tax category code (BT-102) is not "Services outside scope of tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) &gt; 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) &gt; 0) or ((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) = 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-01-AUNZ">
                     <xsl:attribute name="test">((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) &gt; 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) &gt; 0) or ((count(//cac:AllowanceCharge/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) + count(//cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'])) = 0 and count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S']) = 0)</xsl:attribute>
                     <svrl:text>[BR-S-01-AUNZ]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the Tax category code (BT-151, BT-95 or BT-102) is "Standard rated" shall contain in the Tax breakdown (BG-23) at least one Tax category code (BT-118) equal with "Standard rated".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z'])))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-01-AUNZ">
                     <xsl:attribute name="test">((exists(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) or exists(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z'])) and (count(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) = 1)) or (not(//cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']) and not(//cac:ClassifiedTaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID[normalize-space(.) = 'Z']))</xsl:attribute>
                     <svrl:text>[BR-Z-01-AUNZ]-An Invoice that contains an Invoice line (BG-25), a Document level allowance (BG-20) or a Document level charge (BG-21) where the Tax category code (BT-151, BT-95 or BT-102) is "Zero rated" shall contain in the Tax breakdown (BG-23) exactly one Tax category code (BT-118) equal with "Zero rated".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine | cac:CreditNoteLine"
                 priority="72"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine | cac:CreditNoteLine" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine | cac:CreditNoteLine</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine | cac:CreditNoteLine</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cbc:ID) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-21">
                     <xsl:attribute name="test">(cbc:ID) != ''</xsl:attribute>
                     <svrl:text>[BR-21]-Each Invoice line (BG-25) shall have an Invoice line identifier (BT-126).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:InvoicedQuantity) or exists(cbc:CreditedQuantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-22">
                     <xsl:attribute name="test">exists(cbc:InvoicedQuantity) or exists(cbc:CreditedQuantity)</xsl:attribute>
                     <svrl:text>[BR-22]-Each Invoice line (BG-25) shall have an Invoiced quantity (BT-129).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:InvoicedQuantity/@unitCode) or exists(cbc:CreditedQuantity/@unitCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-23">
                     <xsl:attribute name="test">exists(cbc:InvoicedQuantity/@unitCode) or exists(cbc:CreditedQuantity/@unitCode)</xsl:attribute>
                     <svrl:text>[BR-23]-An Invoice line (BG-25) shall have an Invoiced quantity unit of measure code (BT-130).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:LineExtensionAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-24">
                     <xsl:attribute name="test">exists(cbc:LineExtensionAmount)</xsl:attribute>
                     <svrl:text>[BR-24]-Each Invoice line (BG-25) shall have an Invoice line net amount (BT-131).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:Item/cbc:Name) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-25">
                     <xsl:attribute name="test">(cac:Item/cbc:Name) != ''</xsl:attribute>
                     <svrl:text>[BR-25]-Each Invoice line (BG-25) shall contain the Item name (BT-153).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:Price/cbc:PriceAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-26">
                     <xsl:attribute name="test">exists(cac:Price/cbc:PriceAmount)</xsl:attribute>
                     <svrl:text>[BR-26]-Each Invoice line (BG-25) shall contain the Item net price (BT-146).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:Price/cbc:PriceAmount) &gt;= 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-27">
                     <xsl:attribute name="test">(cac:Price/cbc:PriceAmount) &gt;= 0</xsl:attribute>
                     <svrl:text>[BR-27]-The Item net price (BT-146) shall NOT be negative.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:Price/cac:AllowanceCharge/cbc:BaseAmount) &gt;= 0 or not(exists(cac:Price/cac:AllowanceCharge/cbc:BaseAmount)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-28">
                     <xsl:attribute name="test">(cac:Price/cac:AllowanceCharge/cbc:BaseAmount) &gt;= 0 or not(exists(cac:Price/cac:AllowanceCharge/cbc:BaseAmount))</xsl:attribute>
                     <svrl:text>[BR-28]-The Item gross price (BT-148) shall NOT be negative.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((cac:Item/cac:ClassifiedTaxCategory[cac:TaxScheme/(normalize-space(upper-case(cbc:ID))='GST')]/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-04-AUNZ">
                     <xsl:attribute name="test">(cac:Item/cac:ClassifiedTaxCategory[cac:TaxScheme/(normalize-space(upper-case(cbc:ID))='GST')]/cbc:ID)</xsl:attribute>
                     <svrl:text>[BR-CO-04-AUNZ]-Each Invoice line (BG-25) shall be categorized with an Invoiced item Tax category code (BT-151).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:LineExtensionAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-23">
                     <xsl:attribute name="test">string-length(substring-after(cbc:LineExtensionAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-23]-The allowed maximum number of decimals for the Invoice line net amount (BT-131) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]"
                 priority="71"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:Amount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-41">
                     <xsl:attribute name="test">exists(cbc:Amount)</xsl:attribute>
                     <svrl:text>[BR-41]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance amount (BT-136).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-42">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-42]-Each Invoice line allowance (BG-27) shall have an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-23">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-CO-23]-Each Invoice line allowance (BG-27) shall contain an Invoice line allowance reason (BT-139) or an Invoice line allowance reason code (BT-140), or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:Amount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-24">
                     <xsl:attribute name="test">string-length(substring-after(cbc:Amount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-24]-The allowed maximum number of decimals for the Invoice line allowance amount (BT-136) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-25">
                     <xsl:attribute name="test">string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-25]-The allowed maximum number of decimals for the Invoice line allowance base amount (BT-137) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]"
                 priority="70"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:Amount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-43">
                     <xsl:attribute name="test">exists(cbc:Amount)</xsl:attribute>
                     <svrl:text>[BR-43]-Each Invoice line charge (BG-28) shall have an Invoice line charge amount (BT-141).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-44">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-44]-Each Invoice line charge shall have an Invoice line charge reason or an invoice line allowance reason code. </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-24">
                     <xsl:attribute name="test">exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[BR-CO-24]-Each Invoice line charge (BG-28) shall contain an Invoice line charge reason (BT-144) or an Invoice line charge reason code (BT-145), or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:Amount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-27">
                     <xsl:attribute name="test">string-length(substring-after(cbc:Amount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-27]-The allowed maximum number of decimals for the Invoice line charge amount (BT-141) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-28">
                     <xsl:attribute name="test">string-length(substring-after(cbc:BaseAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-28]-The allowed maximum number of decimals for the Invoice line charge base amount (BT-142) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod"
                 priority="69"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) &gt;= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-30">
                     <xsl:attribute name="test">(exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) &gt;= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate))</xsl:attribute>
                     <svrl:text>[BR-30]-If both Invoice line period start date (BT-134) and Invoice line period end date (BT-135) are given then the Invoice line period end date (BT-135) shall be later or equal to the Invoice line period start date (BT-134).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:StartDate) or exists(cbc:EndDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-20">
                     <xsl:attribute name="test">exists(cbc:StartDate) or exists(cbc:EndDate)</xsl:attribute>
                     <svrl:text>[BR-CO-20]-If Invoice line period (BG-26) is used, the Invoice line period start date (BT-134) or the Invoice line period end date (BT-135) shall be filled, or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoicePeriod" priority="68" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoicePeriod" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoicePeriod</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoicePeriod</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) &gt;= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-29">
                     <xsl:attribute name="test">(exists(cbc:EndDate) and exists(cbc:StartDate) and xs:date(cbc:EndDate) &gt;= xs:date(cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate))</xsl:attribute>
                     <svrl:text>[BR-29]-If both Invoicing period start date (BT-73) and Invoicing period end date (BT-74) are given then the Invoicing period end date (BT-74) shall be later or equal to the Invoicing period start date (BT-73).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:StartDate) or exists(cbc:EndDate) or (exists(cbc:DescriptionCode) and not(exists(cbc:StartDate)) and not(exists(cbc:EndDate))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-19">
                     <xsl:attribute name="test">exists(cbc:StartDate) or exists(cbc:EndDate) or (exists(cbc:DescriptionCode) and not(exists(cbc:StartDate)) and not(exists(cbc:EndDate)))</xsl:attribute>
                     <svrl:text>[BR-CO-19]-If Invoicing period (BG-14) is used, the Invoicing period start date (BT-73) or the Invoicing period end date (BT-74) shall be filled, or both.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="//cac:AdditionalItemProperty" priority="67" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "//cac:AdditionalItemProperty" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:AdditionalItemProperty</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//cac:AdditionalItemProperty</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:Name) and exists(cbc:Value))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-54">
                     <xsl:attribute name="test">exists(cbc:Name) and exists(cbc:Value)</xsl:attribute>
                     <svrl:text>[BR-54]-Each Item attribute (BG-32) shall contain an Item attribute name (BT-160) and an Item attribute value (BT-161).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"
                 priority="66"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-65">
                     <xsl:attribute name="test">exists(@listID)</xsl:attribute>
                     <svrl:text>[BR-65]-The Item classification identifier (BT-158) shall have a Scheme identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID"
                 priority="65"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-64">
                     <xsl:attribute name="test">exists(@schemeID)</xsl:attribute>
                     <svrl:text>[BR-64]-The Item standard identifier (BT-157) shall have a Scheme identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PayeeParty" priority="64" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PayeeParty" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PayeeParty</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PayeeParty</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cac:PartyName/cbc:Name) and (not(cac:PartyName/cbc:Name = ../cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) and not(cac:PartyIdentification/cbc:ID = ../cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID) ))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-17">
                     <xsl:attribute name="test">exists(cac:PartyName/cbc:Name) and (not(cac:PartyName/cbc:Name = ../cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) and not(cac:PartyIdentification/cbc:ID = ../cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID) )</xsl:attribute>
                     <svrl:text>[BR-17]-The Payee name (BT-59) shall be provided in the Invoice, if the Payee (BG-10) is different from the Seller (BG-4)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PaymentMeans[cbc:PaymentMeansCode='30' or cbc:PaymentMeansCode='58']/cac:PayeeFinancialAccount"
                 priority="63"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentMeans[cbc:PaymentMeansCode='30' or cbc:PaymentMeansCode='58']/cac:PayeeFinancialAccount" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans[cbc:PaymentMeansCode='30' or cbc:PaymentMeansCode='58']/cac:PayeeFinancialAccount</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans[cbc:PaymentMeansCode='30' or cbc:PaymentMeansCode='58']/cac:PayeeFinancialAccount</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cbc:ID) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-50">
                     <xsl:attribute name="test">(cbc:ID) != ''</xsl:attribute>
                     <svrl:text>[BR-50]-A Payment account identifier (BT-84) shall be present if Credit transfer (BG-17) information is provided in the Invoice.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PaymentMeans" priority="62" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentMeans" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:PaymentMeansCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-49">
                     <xsl:attribute name="test">exists(cbc:PaymentMeansCode)</xsl:attribute>
                     <svrl:text>[BR-49]-A Payment instruction (BG-16) shall specify the Payment means type code (BT-81).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((exists(cac:PayeeFinancialAccount/cbc:ID) and ((normalize-space(cbc:PaymentMeansCode) = '30') or (normalize-space(cbc:PaymentMeansCode) = '58') )) or ((normalize-space(cbc:PaymentMeansCode) != '30') and (normalize-space(cbc:PaymentMeansCode) != '58')))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-61">
                     <xsl:attribute name="test">(exists(cac:PayeeFinancialAccount/cbc:ID) and ((normalize-space(cbc:PaymentMeansCode) = '30') or (normalize-space(cbc:PaymentMeansCode) = '58') )) or ((normalize-space(cbc:PaymentMeansCode) != '30') and (normalize-space(cbc:PaymentMeansCode) != '58'))</xsl:attribute>
                     <svrl:text>[BR-61]-If the Payment means type code (BT-81) means SEPA credit transfer, Local credit transfer or Non-SEPA international credit transfer, the Payment account identifier (BT-84) shall be present.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:BillingReference" priority="61" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:BillingReference" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:BillingReference</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:BillingReference</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cac:InvoiceDocumentReference/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-55">
                     <xsl:attribute name="test">exists(cac:InvoiceDocumentReference/cbc:ID)</xsl:attribute>
                     <svrl:text>[BR-55]-Each Preceding Invoice reference (BG-3) shall contain a Preceding Invoice reference (BT-25).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AccountingSupplierParty/cac:Party/cbc:EndpointID"
                 priority="60"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AccountingSupplierParty/cac:Party/cbc:EndpointID" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party/cbc:EndpointID</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party/cbc:EndpointID</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-62">
                     <xsl:attribute name="test">exists(@schemeID)</xsl:attribute>
                     <svrl:text>[BR-62]-The Seller electronic address (BT-34) shall have a Scheme identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress"
                 priority="59"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AccountingSupplierParty/cac:Party/cac:PostalAddress" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party/cac:PostalAddress</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party/cac:PostalAddress</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cac:Country/cbc:IdentificationCode) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-09">
                     <xsl:attribute name="test">(cac:Country/cbc:IdentificationCode) != ''</xsl:attribute>
                     <svrl:text>[BR-09]-The Seller postal address (BG-5) shall contain a Seller country code (BT-40).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxRepresentativeParty" priority="58" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxRepresentativeParty" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cac:PartyName/cbc:Name) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-18">
                     <xsl:attribute name="test">(cac:PartyName/cbc:Name) != ''</xsl:attribute>
                     <svrl:text>[BR-18]-The Seller tax representative name (BT-62) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:PostalAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-19">
                     <xsl:attribute name="test">exists(cac:PostalAddress)</xsl:attribute>
                     <svrl:text>[BR-19]-The Seller tax representative postal address (BG-12) shall be provided in the Invoice, if the Seller (BG-4) has a Seller tax representative party (BG-11).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'GST')]/cbc:CompanyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-56-AUNZ">
                     <xsl:attribute name="test">exists(cac:PartyTaxScheme[cac:TaxScheme/(normalize-space(upper-case(cbc:ID)) = 'GST')]/cbc:CompanyID)</xsl:attribute>
                     <svrl:text>[BR-56-AUNZ]-Each Seller tax representative party (BG-11) shall have a Seller tax representative Tax identifier (BT-63).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxRepresentativeParty/cac:PostalAddress"
                 priority="57"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxRepresentativeParty/cac:PostalAddress" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty/cac:PostalAddress</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty/cac:PostalAddress</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cac:Country/cbc:IdentificationCode) != '')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-20">
                     <xsl:attribute name="test">(cac:Country/cbc:IdentificationCode) != ''</xsl:attribute>
                     <svrl:text>[BR-20]-The Seller tax representative postal address (BG-12) shall contain a Tax representative country code (BT-69), if the Seller (BG-4) has a Seller tax representative party (BG-11).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:TaxTotal"
                 priority="56"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:TaxTotal" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:TaxTotal</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:TaxTotal</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-14-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)</xsl:attribute>
                     <svrl:text>[BR-CO-14-AUNZ]-Invoice total Tax amount (BT-110) = Σ Tax category tax amount (BT-117).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxTotal/cac:TaxSubtotal" priority="55" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal/cac:TaxSubtotal" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal/cac:TaxSubtotal</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal/cac:TaxSubtotal</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(exists(cbc:TaxableAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-45-AUNZ">
                     <xsl:attribute name="test">exists(cbc:TaxableAmount)</xsl:attribute>
                     <svrl:text>[BR-45-AUNZ]-Each Tax breakdown (BG-23) shall have a Tax category taxable amount (BT-116).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cbc:TaxAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-46-AUNZ">
                     <xsl:attribute name="test">exists(cbc:TaxAmount)</xsl:attribute>
                     <svrl:text>[BR-46-AUNZ]-Each Tax breakdown (BG-23) shall have a Tax category tax amount (BT-117).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-47-AUNZ">
                     <xsl:attribute name="test">exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:ID)</xsl:attribute>
                     <svrl:text>[BR-47-AUNZ]-Each Tax breakdown (BG-23) shall be defined through a Tax category code (BT-118).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:Percent) or (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/normalize-space(cbc:ID)='O'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-48-AUNZ">
                     <xsl:attribute name="test">exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/cbc:Percent) or (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/normalize-space(cbc:ID)='O')</xsl:attribute>
                     <svrl:text>[BR-48-AUNZ]-Each Tax breakdown (BG-23) shall have a Tax category rate (BT-119), except if the Invoice is not subject to Tax.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((round(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent)) = 0 and (round(xs:decimal(cbc:TaxAmount)) = 0)) or (round(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent)) != 0 and ((abs(xs:decimal(cbc:TaxAmount)) - 1 &lt; round(abs(xs:decimal(cbc:TaxableAmount)) * (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 ) and (abs(xs:decimal(cbc:TaxAmount)) + 1 &gt; round(abs(xs:decimal(cbc:TaxableAmount)) * (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 )))  or (not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent))) and (round(xs:decimal(cbc:TaxAmount)) = 0)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CO-17-AUNZ">
                     <xsl:attribute name="test">(round(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent)) = 0 and (round(xs:decimal(cbc:TaxAmount)) = 0)) or (round(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent)) != 0 and ((abs(xs:decimal(cbc:TaxAmount)) - 1 &lt; round(abs(xs:decimal(cbc:TaxableAmount)) * (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 ) and (abs(xs:decimal(cbc:TaxAmount)) + 1 &gt; round(abs(xs:decimal(cbc:TaxableAmount)) * (cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 )))  or (not(exists(cac:TaxCategory[cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']/xs:decimal(cbc:Percent))) and (round(xs:decimal(cbc:TaxAmount)) = 0))</xsl:attribute>
                     <svrl:text>[BR-CO-17-AUNZ]-Tax category tax amount (BT-117) = Tax category taxable amount (BT-116) x (Tax category rate (BT-119) / 100), rounded to two decimals.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:TaxableAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-19-AUNZ">
                     <xsl:attribute name="test">string-length(substring-after(cbc:TaxableAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-19-AUNZ]-The allowed maximum number of decimals for the Tax category taxable amount (BT-116) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(substring-after(cbc:TaxAmount,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-DEC-20-AUNZ">
                     <xsl:attribute name="test">string-length(substring-after(cbc:TaxAmount,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[BR-DEC-20-AUNZ]-The allowed maximum number of decimals for the Tax category tax amount (BT-117) is 2.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="54"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-08-AUNZ">
                     <xsl:attribute name="test">(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='E']/xs:decimal(cbc:Amount)))))</xsl:attribute>
                     <svrl:text>[BR-E-08-AUNZ]-In a Tax breakdown (BG-23) where the Tax category code (BT-118) is "Exempt from Tax" the Tax category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the Tax category codes (BT-151, BT-95, BT-102) are "Exempt from Tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(../cbc:TaxAmount) = 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-09-AUNZ">
                     <xsl:attribute name="test">xs:decimal(../cbc:TaxAmount) = 0</xsl:attribute>
                     <svrl:text>[BR-E-09-AUNZ]-The Tax category tax amount (BT-117) In a Tax breakdown (BG-23) where the Tax category code (BT-118) equals "Exempt from Tax" shall equal 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="53"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-06">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-E-06]-In a Document level allowance (BG-20) where the Document level allowance Tax category code (BT-95) is "Exempt from Tax", the Document level allowance Tax rate (BT-96) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="52"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-07">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-E-07]-In a Document level charge (BG-21) where the Document level charge Tax category code (BT-102) is "Exempt from Tax", the Document level charge Tax rate (BT-103) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="51"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'E'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-E-05-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-E-05-AUNZ]-In an Invoice line (BG-25) where the Invoiced item Tax category code (BT-151) is "Exempt from Tax", the Invoiced item Tax rate (BT-152) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="50"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-08-AUNZ">
                     <xsl:attribute name="test">(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='G']/xs:decimal(cbc:Amount)))))</xsl:attribute>
                     <svrl:text>[BR-G-08-AUNZ]-In a Tax breakdown (BG-23) where the Tax category code (BT-118) is "Free export item, tax not charged" the Tax category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the Tax category codes (BT-151, BT-95, BT-102) are "Free export item, tax not charged".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(../cbc:TaxAmount) = 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-09-AUNZ">
                     <xsl:attribute name="test">xs:decimal(../cbc:TaxAmount) = 0</xsl:attribute>
                     <svrl:text>[BR-G-09-AUNZ]-The Tax category tax amount (BT-117) in a Tax breakdown (BG-23) where the Tax category code (BT-118) is "Free export item, tax not charged" shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="49"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-06-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-G-06-AUNZ]-In a Document level allowance (BG-20) where the Document level allowance Tax category code (BT-95) is "Free export item, tax not charged" the Document level allowance Tax rate (BT-96) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="48"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-07-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-G-07-AUNZ]-In a Document level charge (BG-21) where the Document level charge Tax category code (BT-102) is "Free export item, tax not charged" the Document level charge Tax rate (BT-103) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="47"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'G'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-G-05-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-G-05-AUNZ]-In an Invoice line (BG-25) where the Invoiced item Tax category code (BT-151) is "Free export item, tax not charged" the Invoiced item Tax rate (BT-152) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="46"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-08-AUNZ">
                     <xsl:attribute name="test">(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='O']/xs:decimal(cbc:Amount)))))</xsl:attribute>
                     <svrl:text>[BR-O-08-AUNZ]-In a Tax breakdown (BG-23) where the Tax category code (BT-118) is "Services outside scope of tax" the Tax category taxable amount (BT-116) shall equal the sum of Invoice line net amounts (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the Tax category codes (BT-151, BT-95, BT-102) are "Services outside scope of tax".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(../cbc:TaxAmount) = 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-09-AUNZ">
                     <xsl:attribute name="test">xs:decimal(../cbc:TaxAmount) = 0</xsl:attribute>
                     <svrl:text>[BR-O-09-AUNZ]-The Tax category tax amount (BT-117) in a Tax breakdown (BG-23) where the Tax category code (BT-118) is "Services outside scope of tax" shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="45"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(not(cbc:Percent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-06-AUNZ">
                     <xsl:attribute name="test">not(cbc:Percent)</xsl:attribute>
                     <svrl:text>[BR-O-06-AUNZ]-A Document level allowance (BG-20) where Tax category code (BT-95) is "Services outside scope of tax" shall not contain a Document level allowance Tax rate (BT-96).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="44"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(not(cbc:Percent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-07-AUNZ">
                     <xsl:attribute name="test">not(cbc:Percent)</xsl:attribute>
                     <svrl:text>[BR-O-07-AUNZ]-A Document level charge (BG-21) where the Tax category code (BT-102) is "Services outside scope of tax" shall not contain a Document level charge Tax rate (BT-103).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="43"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'O'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(not(cbc:Percent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-O-05-AUNZ">
                     <xsl:attribute name="test">not(cbc:Percent)</xsl:attribute>
                     <svrl:text>[BR-O-05-AUNZ]-An Invoice line (BG-25) where the Tax category code (BT-151) is "Services outside scope of tax" shall not contain an Invoiced item Tax rate (BT-152).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="42"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/*/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(every $rate in xs:decimal(cbc:Percent) satisfies (((exists(//cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID) = 'S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]) or exists(//cac:AllowanceCharge[cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate])) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) &gt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))))) or (exists(//cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID) = 'S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]) or exists(//cac:AllowanceCharge[cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate])) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) &gt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-08-AUNZ">
                     <xsl:attribute name="test">every $rate in xs:decimal(cbc:Percent) satisfies (((exists(//cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID) = 'S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]) or exists(//cac:AllowanceCharge[cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate])) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) &gt; (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))))) or (exists(//cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID) = 'S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]) or exists(//cac:AllowanceCharge[cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate])) and ((../xs:decimal(cbc:TaxableAmount - 1) &lt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)))) and (../xs:decimal(cbc:TaxableAmount + 1) &gt; (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='S'][cac:Item/cac:ClassifiedTaxCategory/xs:decimal(cbc:Percent) =$rate]/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='S'][cac:TaxCategory/xs:decimal(cbc:Percent) = $rate]/xs:decimal(cbc:Amount))))))</xsl:attribute>
                     <svrl:text>[BR-S-08-AUNZ]-For each different value of Tax category rate (BT-119) where the Tax category code (BT-118) is "Standard rated", the Tax category taxable amount (BT-116) in a Tax breakdown (BG-23) shall equal the sum of Invoice line net amounts (BT-131) plus the sum of document level charge amounts (BT-99) minus the sum of document level allowance amounts (BT-92) where the Tax category code (BT-151, BT-102, BT-95) is "Standard rated" and the Tax rate (BT-152, BT-103, BT-96) equals the Tax category rate (BT-119).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((abs(xs:decimal(../cbc:TaxAmount)) - 1 &lt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 ) and (abs(xs:decimal(../cbc:TaxAmount)) + 1 &gt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 ))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-09-AUNZ">
                     <xsl:attribute name="test">(abs(xs:decimal(../cbc:TaxAmount)) - 1 &lt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 ) and (abs(xs:decimal(../cbc:TaxAmount)) + 1 &gt;  round((abs(xs:decimal(../cbc:TaxableAmount)) * (xs:decimal(cbc:Percent) div 100)) * 10 * 10) div 100 )</xsl:attribute>
                     <svrl:text>[BR-S-09-AUNZ]-The Tax category tax amount (BT-117) in a Tax breakdown (BG-23) where Tax category code (BT-118) is "Standard rated" shall equal the Tax category taxable amount (BT-116) multiplied by the Tax category rate (BT-119).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:TaxExemptionReason) and not(cbc:TaxExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-10-AUNZ">
                     <xsl:attribute name="test">not(cbc:TaxExemptionReason) and not(cbc:TaxExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[BR-S-10-AUNZ]-A Tax breakdown (BG-23) with Tax Category code (BT-118) "Standard rate" shall not have a Tax exemption reason code (BT-121) or Tax exemption reason text (BT-120).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="41"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-06-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) &gt; 0)</xsl:attribute>
                     <svrl:text>[BR-S-06-AUNZ]-In a Document level allowance (BG-20) where the Document level allowance Tax category code (BT-95) is "Standard rated" the Document level allowance Tax rate (BT-96) shall be greater than zero.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="40"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-07-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) &gt; 0)</xsl:attribute>
                     <svrl:text>[BR-S-07-AUNZ]-In a Document level charge (BG-21) where the Document level charge Tax category code (BT-102) is "Standard rated" the Document level charge Tax rate (BT-103) shall be greater than zero.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="39"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'S'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-S-05-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) &gt; 0)</xsl:attribute>
                     <svrl:text>[BR-S-05-AUNZ]-In an Invoice line (BG-25) where the Invoiced item Tax category code (BT-151) is "Standard rated" the Invoiced item Tax rate (BT-152) shall be greater than zero.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="38"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-08-AUNZ">
                     <xsl:attribute name="test">(exists(//cac:InvoiceLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:InvoiceLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount))))) or (exists(//cac:CreditNoteLine) and (xs:decimal(../cbc:TaxableAmount) = (sum(../../../cac:CreditNoteLine[cac:Item/cac:ClassifiedTaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:LineExtensionAmount)) + sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=true()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)) - sum(../../../cac:AllowanceCharge[cbc:ChargeIndicator=false()][cac:TaxCategory/normalize-space(cbc:ID)='Z']/xs:decimal(cbc:Amount)))))</xsl:attribute>
                     <svrl:text>[BR-Z-08-AUNZ]-In a Tax breakdown (BG-23) where Tax category code (BT-118) is "Zero rated" the Tax category taxable amount (BT-116) shall equal the sum of Invoice line net amount (BT-131) minus the sum of Document level allowance amounts (BT-92) plus the sum of Document level charge amounts (BT-99) where the Tax category codes (BT-151, BT-95, BT-102) are "Zero rated".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(xs:decimal(../cbc:TaxAmount) = 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-09-AUNZ">
                     <xsl:attribute name="test">xs:decimal(../cbc:TaxAmount) = 0</xsl:attribute>
                     <svrl:text>[BR-Z-09-AUNZ]-The Tax category tax amount (BT-117) in a Tax breakdown (BG-23) where Tax category code (BT-118) is "Zero rated" shall equal 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cbc:TaxExemptionReason) or (cbc:TaxExemptionReasonCode)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-10-AUNZ">
                     <xsl:attribute name="test">not((cbc:TaxExemptionReason) or (cbc:TaxExemptionReasonCode))</xsl:attribute>
                     <svrl:text>[BR-Z-10-AUNZ]-A Tax breakdown (BG-23) with Tax Category code (BT-118) "Zero rated" shall not have a Tax exemption reason code (BT-121) or Tax exemption reason text (BT-120).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="37"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=false()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-06-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-Z-06-AUNZ]-In a Document level allowance (BG-20) where the Document level allowance Tax category code (BT-95) is "Zero rated" the Document level allowance Tax rate (BT-96) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="36"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator=true()]/cac:TaxCategory[normalize-space(cbc:ID)='Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-07-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-Z-07-AUNZ]-In a Document level charge (BG-21) where the Document level charge Tax category code (BT-102) is "Zero rated" the Document level charge Tax rate (BT-103) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']"
                 priority="35"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e29']">
            <schxslt:rule pattern="d12e29">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e29">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST'] | cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory[normalize-space(cbc:ID) = 'Z'][cac:TaxScheme/normalize-space(upper-case(cbc:ID))='GST']</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((xs:decimal(cbc:Percent) = 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-Z-05-AUNZ">
                     <xsl:attribute name="test">(xs:decimal(cbc:Percent) = 0)</xsl:attribute>
                     <svrl:text>[BR-Z-05-AUNZ]-In an Invoice line (BG-25) where the Invoiced item Tax category code (BT-151) is "Zero rated" the Invoiced item Tax rate (BT-152) shall be 0 (zero).</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e29')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AccountingSupplierParty/cac:Party"
                 priority="34"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AccountingSupplierParty/cac:Party" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AccountingSupplierParty/cac:Party</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cac:PartyTaxScheme) &lt;= 2))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-42">
                     <xsl:attribute name="test">(count(cac:PartyTaxScheme) &lt;= 2)</xsl:attribute>
                     <svrl:text>[UBL-SR-42]-Party tax scheme shall occur maximum twice in accounting supplier party</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AdditionalDocumentReference" priority="33" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AdditionalDocumentReference" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cbc:DocumentDescription) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-33">
                     <xsl:attribute name="test">(count(cbc:DocumentDescription) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-33]-Supporting document description shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(((cbc:DocumentTypeCode='130') or ((local-name(/*) = 'CreditNote') and (cbc:DocumentTypeCode='50')) or (not(cbc:ID/@scheme) and not(cbc:DocumentTypeCode))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-43">
                     <xsl:attribute name="test">((cbc:DocumentTypeCode='130') or ((local-name(/*) = 'CreditNote') and (cbc:DocumentTypeCode='50')) or (not(cbc:ID/@scheme) and not(cbc:DocumentTypeCode)))</xsl:attribute>
                     <svrl:text>[UBL-SR-43]-Scheme identifier shall only be used for invoiced object (document type code with value 130)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="//*[ends-with(name(), 'Amount') and not(ends-with(name(),'PriceAmount')) and not(ancestor::cac:Price/cac:AllowanceCharge)]"
                 priority="32"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "//*[ends-with(name(), 'Amount') and not(ends-with(name(),'PriceAmount')) and not(ancestor::cac:Price/cac:AllowanceCharge)]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//*[ends-with(name(), 'Amount') and not(ends-with(name(),'PriceAmount')) and not(ancestor::cac:Price/cac:AllowanceCharge)]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//*[ends-with(name(), 'Amount') and not(ends-with(name(),'PriceAmount')) and not(ancestor::cac:Price/cac:AllowanceCharge)]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(string-length(substring-after(.,'.'))&lt;=2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-DT-01">
                     <xsl:attribute name="test">string-length(substring-after(.,'.'))&lt;=2</xsl:attribute>
                     <svrl:text>[UBL-DT-01]-Amounts shall be decimal up to two fraction digits</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="//*[ends-with(name(), 'BinaryObject')]"
                 priority="31"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "//*[ends-with(name(), 'BinaryObject')]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//*[ends-with(name(), 'BinaryObject')]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">//*[ends-with(name(), 'BinaryObject')]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((@mimeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-DT-06">
                     <xsl:attribute name="test">(@mimeCode)</xsl:attribute>
                     <svrl:text>[UBL-DT-06]-Binary object elements shall contain the mime code attribute</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((@filename))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-DT-07">
                     <xsl:attribute name="test">(@filename)</xsl:attribute>
                     <svrl:text>[UBL-DT-07]-Binary object elements shall contain the file name attribute</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:Delivery" priority="30" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:Delivery" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Delivery</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Delivery</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-25">
                     <xsl:attribute name="test">(count(cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-25]-Deliver to party name shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = false()]"
                 priority="29"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator = false()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = false()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cbc:AllowanceChargeReason) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-30">
                     <xsl:attribute name="test">(count(cbc:AllowanceChargeReason) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-30]-Document level allowance reason shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = true()]"
                 priority="28"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator = true()]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = true()]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cbc:AllowanceChargeReason) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-31">
                     <xsl:attribute name="test">(count(cbc:AllowanceChargeReason) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-31]-Document level charge reason shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/ubl:Invoice | /cn:CreditNote" priority="27" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/ubl:Invoice | /cn:CreditNote" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice | /cn:CreditNote</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/ubl:Invoice | /cn:CreditNote</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(not(ext:UBLExtensions))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-001">
                     <xsl:attribute name="test">not(ext:UBLExtensions)</xsl:attribute>
                     <svrl:text>[UBL-CR-001]-A UBL invoice should not include extensions</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:UBLVersionID) or cbc:UBLVersionID = '2.1')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-002">
                     <xsl:attribute name="test">not(cbc:UBLVersionID) or cbc:UBLVersionID = '2.1'</xsl:attribute>
                     <svrl:text>[UBL-CR-002]-A UBL invoice should not include the UBLVersionID or it should be '2.1'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:ProfileExecutionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-003">
                     <xsl:attribute name="test">not(cbc:ProfileExecutionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-003]-A UBL invoice should not include the ProfileExecutionID </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-004">
                     <xsl:attribute name="test">not(cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-004]-A UBL invoice should not include the CopyIndicator </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-005">
                     <xsl:attribute name="test">not(cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-005]-A UBL invoice should not include the UUID </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-006">
                     <xsl:attribute name="test">not(cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-006]-A UBL invoice should not include the IssueTime </svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:PricingCurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-007">
                     <xsl:attribute name="test">not(cbc:PricingCurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-007]-A UBL invoice should not include the PricingCurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:PaymentCurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-008">
                     <xsl:attribute name="test">not(cbc:PaymentCurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-008]-A UBL invoice should not include the PaymentCurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:PaymentAlternativeCurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-009">
                     <xsl:attribute name="test">not(cbc:PaymentAlternativeCurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-009]-A UBL invoice should not include the PaymentAlternativeCurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:AccountingCostCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-010">
                     <xsl:attribute name="test">not(cbc:AccountingCostCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-010]-A UBL invoice should not include the AccountingCostCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:LineCountNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-011">
                     <xsl:attribute name="test">not(cbc:LineCountNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-011]-A UBL invoice should not include the LineCountNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:InvoicePeriod/cbc:StartTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-012">
                     <xsl:attribute name="test">not(cac:InvoicePeriod/cbc:StartTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-012]-A UBL invoice should not include the InvoicePeriod StartTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:InvoicePeriod/cbc:EndTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-013">
                     <xsl:attribute name="test">not(cac:InvoicePeriod/cbc:EndTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-013]-A UBL invoice should not include the InvoicePeriod EndTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:InvoicePeriod/cbc:DurationMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-014">
                     <xsl:attribute name="test">not(cac:InvoicePeriod/cbc:DurationMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-014]-A UBL invoice should not include the InvoicePeriod DurationMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:InvoicePeriod/cbc:Description))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-015">
                     <xsl:attribute name="test">not(cac:InvoicePeriod/cbc:Description)</xsl:attribute>
                     <svrl:text>[UBL-CR-015]-A UBL invoice should not include the InvoicePeriod Description</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-016">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-016]-A UBL invoice should not include the OrderReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-017">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-017]-A UBL invoice should not include the OrderReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-018">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-018]-A UBL invoice should not include the OrderReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-019">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-019]-A UBL invoice should not include the OrderReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:CustomerReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-020">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:CustomerReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-020]-A UBL invoice should not include the OrderReference CustomerReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:OrderTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-021">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:OrderTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-021]-A UBL invoice should not include the OrderReference OrderTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OrderReference/cbc:DocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-022">
                     <xsl:attribute name="test">not(cac:OrderReference/cbc:DocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-022]-A UBL invoice should not include the OrderReference DocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-023">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-023]-A UBL invoice should not include the BillingReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-024">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-024]-A UBL invoice should not include the BillingReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-025">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-025]-A UBL invoice should not include the BillingReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-026">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-026]-A UBL invoice should not include the BillingReference DocumentTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-027">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-027]-A UBL invoice should not include the BillingReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-028">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-028]-A UBL invoice should not include the BillingReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-029">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-029]-A UBL invoice should not include the BillingReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-030">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-030]-A UBL invoice should not include the BillingReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-031">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-031]-A UBL invoice should not include the BillingReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-032">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-032]-A UBL invoice should not include the BillingReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-033">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-033]-A UBL invoice should not include the BillingReference DocumenDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-034">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-034]-A UBL invoice should not include the BillingReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-035">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-035]-A UBL invoice should not include the BillingReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-036">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-036]-A UBL invoice should not include the BillingReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-037">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:InvoiceDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-037]-A UBL invoice should not include the BillingReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:SelfBilledInvoiceDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-038">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:SelfBilledInvoiceDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-038]-A UBL invoice should not include the BillingReference SelfBilledInvoiceDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:CreditNoteDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-039">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:CreditNoteDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-039]-A UBL invoice should not include the BillingReference CreditNoteDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-040">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:SelfBilledCreditNoteDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-040]-A UBL invoice should not include the BillingReference SelfBilledCreditNoteDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:DebitNoteDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-041">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:DebitNoteDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-041]-A UBL invoice should not include the BillingReference DebitNoteDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:ReminderDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-042">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:ReminderDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-042]-A UBL invoice should not include the BillingReference ReminderDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:AdditionalDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-043">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:AdditionalDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-043]-A UBL invoice should not include the BillingReference AdditionalDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BillingReference/cac:BillingReferenceLine))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-044">
                     <xsl:attribute name="test">not(cac:BillingReference/cac:BillingReferenceLine)</xsl:attribute>
                     <svrl:text>[UBL-CR-044]-A UBL invoice should not include the BillingReference BillingReferenceLine</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-045">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-045]-A UBL invoice should not include the DespatchDocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-046">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-046]-A UBL invoice should not include the DespatchDocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-047">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-047]-A UBL invoice should not include the DespatchDocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-048">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-048]-A UBL invoice should not include the DespatchDocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:DocumentTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-049">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:DocumentTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-049]-A UBL invoice should not include the DespatchDocumentReference DocumentTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-050">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-050]-A UBL invoice should not include the DespatchDocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-051">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-051]-A UBL invoice should not include the DespatchDocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-052">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-052]-A UBL invoice should not include the DespatchDocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-053">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-053]-A UBL invoice should not include the DespatchDocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-054">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-054]-A UBL invoice should not include the DespatchDocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-055">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-055]-A UBL invoice should not include the DespatchDocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-056">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-056]-A UBL invoice should not include the DespatchDocumentReference DocumentDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-057">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-057]-A UBL invoice should not include the DespatchDocumentReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-058">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-058]-A UBL invoice should not include the DespatchDocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-059">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-059]-A UBL invoice should not include the DespatchDocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DespatchDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-060">
                     <xsl:attribute name="test">not(cac:DespatchDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-060]-A UBL invoice should not include the DespatchDocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-061">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-061]-A UBL invoice should not include the ReceiptDocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-062">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-062]-A UBL invoice should not include the ReceiptDocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-063">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-063]-A UBL invoice should not include the ReceiptDocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-064">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-064]-A UBL invoice should not include the ReceiptDocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:DocumentTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-065">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:DocumentTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-065]-A UBL invoice should not include the ReceiptDocumentReference DocumentTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-066">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-066]-A UBL invoice should not include the ReceiptDocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-067">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-067]-A UBL invoice should not include the ReceiptDocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-068">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-068]-A UBL invoice should not include the ReceiptDocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-069">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-069]-A UBL invoice should not include the ReceiptDocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-070">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-070]-A UBL invoice should not include the ReceiptDocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-071">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-071]-A UBL invoice should not include the ReceiptDocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-072">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-072]-A UBL invoice should not include the ReceiptDocumentReference DocumentDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-073">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-073]-A UBL invoice should not include the ReceiptDocumentReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-074">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-074]-A UBL invoice should not include the ReceiptDocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-075">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-075]-A UBL invoice should not include the ReceiptDocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ReceiptDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-076">
                     <xsl:attribute name="test">not(cac:ReceiptDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-076]-A UBL invoice should not include the ReceiptDocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:StatementDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-077">
                     <xsl:attribute name="test">not(cac:StatementDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-077]-A UBL invoice should not include the StatementDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-078">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-078]-A UBL invoice should not include the OriginatorDocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-079">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-079]-A UBL invoice should not include the OriginatorDocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-080">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-080]-A UBL invoice should not include the OriginatorDocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-081">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-081]-A UBL invoice should not include the OriginatorDocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:DocumentTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-082">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:DocumentTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-082]-A UBL invoice should not include the OriginatorDocumentReference DocumentTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-083">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-083]-A UBL invoice should not include the OriginatorDocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-084">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-084]-A UBL invoice should not include the OriginatorDocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-085">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-085]-A UBL invoice should not include the OriginatorDocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-086">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-086]-A UBL invoice should not include the OriginatorDocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-087">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-087]-A UBL invoice should not include the OriginatorDocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-088">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-088]-A UBL invoice should not include the OriginatorDocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-089">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-089]-A UBL invoice should not include the OriginatorDocumentReference DocumentDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-090">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-090]-A UBL invoice should not include the OriginatorDocumentReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-091">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-091]-A UBL invoice should not include the OriginatorDocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-092">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-092]-A UBL invoice should not include the OriginatorDocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:OriginatorDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-093">
                     <xsl:attribute name="test">not(cac:OriginatorDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-093]-A UBL invoice should not include the OriginatorDocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-094">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-094]-A UBL invoice should not include the ContractDocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-095">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-095]-A UBL invoice should not include the ContractDocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-096">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-096]-A UBL invoice should not include the ContractDocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-097">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-097]-A UBL invoice should not include the ContractDocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:DocumentTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-098">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:DocumentTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-098]-A UBL invoice should not include the ContractDocumentReference DocumentTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-099">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-099]-A UBL invoice should not include the ContractDocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-100">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-100]-A UBL invoice should not include the ContractDocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-101">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-101]-A UBL invoice should not include the ContractDocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-102">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-102]-A UBL invoice should not include the ContractDocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-103">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-103]-A UBL invoice should not include the ContractDocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-104">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-104]-A UBL invoice should not include the ContractDocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-105">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-105]-A UBL invoice should not include the ContractDocumentReference DocumentDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-106">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-106]-A UBL invoice should not include the ContractDocumentReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-107">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-107]-A UBL invoice should not include the ContractDocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-108">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-108]-A UBL invoice should not include the ContractDocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ContractDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-109">
                     <xsl:attribute name="test">not(cac:ContractDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-109]-A UBL invoice should not include the ContractDocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-110">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-110]-A UBL invoice should not include the AdditionalDocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-111">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-111]-A UBL invoice should not include the AdditionalDocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-112">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-112]-A UBL invoice should not include the AdditionalDocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-113">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-113]-A UBL invoice should not include the AdditionalDocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-114">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-114]-A UBL invoice should not include the AdditionalDocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-115">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-115]-A UBL invoice should not include the AdditionalDocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-116">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-116]-A UBL invoice should not include the AdditionalDocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-117">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-117]-A UBL invoice should not include the AdditionalDocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-118">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-118]-A UBL invoice should not include the AdditionalDocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-119">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-119]-A UBL invoice should not include the AdditionalDocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-121">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash)</xsl:attribute>
                     <svrl:text>[UBL-CR-121]-A UBL invoice should not include the AdditionalDocumentReference Attachment External DocumentHash</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-122">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod)</xsl:attribute>
                     <svrl:text>[UBL-CR-122]-A UBL invoice should not include the AdditionalDocumentReference Attachment External HashAlgorithmMethod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-123">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-123]-A UBL invoice should not include the AdditionalDocumentReference Attachment External ExpiryDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-124">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-124]-A UBL invoice should not include the AdditionalDocumentReference Attachment External ExpiryTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-125">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:MimeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-125]-A UBL invoice should not include the AdditionalDocumentReference Attachment External MimeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-126">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-126]-A UBL invoice should not include the AdditionalDocumentReference Attachment External FormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-127">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:EncodingCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-127]-A UBL invoice should not include the AdditionalDocumentReference Attachment External EncodingCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-128">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:CharacterSetCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-128]-A UBL invoice should not include the AdditionalDocumentReference Attachment External CharacterSetCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-129">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:FileName)</xsl:attribute>
                     <svrl:text>[UBL-CR-129]-A UBL invoice should not include the AdditionalDocumentReference Attachment External FileName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-130">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:Description)</xsl:attribute>
                     <svrl:text>[UBL-CR-130]-A UBL invoice should not include the AdditionalDocumentReference Attachment External Descriprion</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-131">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-131]-A UBL invoice should not include the AdditionalDocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-132">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-132]-A UBL invoice should not include the AdditionalDocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-133">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-133]-A UBL invoice should not include the AdditionalDocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ProjectReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-134">
                     <xsl:attribute name="test">not(cac:ProjectReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-134]-A UBL invoice should not include the ProjectReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ProjectReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-135">
                     <xsl:attribute name="test">not(cac:ProjectReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-135]-A UBL invoice should not include the ProjectReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:ProjectReference/cac:WorkPhaseReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-136">
                     <xsl:attribute name="test">not(cac:ProjectReference/cac:WorkPhaseReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-136]-A UBL invoice should not include the ProjectReference WorkPhaseReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Signature))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-137">
                     <xsl:attribute name="test">not(cac:Signature)</xsl:attribute>
                     <svrl:text>[UBL-CR-137]-A UBL invoice should not include the Signature</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-138">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID)</xsl:attribute>
                     <svrl:text>[UBL-CR-138]-A UBL invoice should not include the AccountingSupplierParty CustomerAssignedAccountID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cbc:AdditionalAccountID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-139">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cbc:AdditionalAccountID)</xsl:attribute>
                     <svrl:text>[UBL-CR-139]-A UBL invoice should not include the AccountingSupplierParty AdditionalAccountID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cbc:DataSendingCapability))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-140">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cbc:DataSendingCapability)</xsl:attribute>
                     <svrl:text>[UBL-CR-140]-A UBL invoice should not include the AccountingSupplierParty DataSendingCapability</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-141">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cbc:MarkCareIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-141]-A UBL invoice should not include the AccountingSupplierParty Party MarkCareIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-142">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cbc:MarkAttentionIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-142]-A UBL invoice should not include the AccountingSupplierParty Party MarkAttentionIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-143">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-143]-A UBL invoice should not include the AccountingSupplierParty Party WebsiteURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-144">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cbc:LogoReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-144]-A UBL invoice should not include the AccountingSupplierParty Party LogoReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cbc:IndustryClassificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-145">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cbc:IndustryClassificationCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-145]-A UBL invoice should not include the AccountingSupplierParty Party IndustryClassificationCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Language))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-146">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Language)</xsl:attribute>
                     <svrl:text>[UBL-CR-146]-A UBL invoice should not include the AccountingSupplierParty Party Language</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-147">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-147]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-148">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-148]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress AddressTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-149">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-149]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress AddressFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-150">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Postbox)</xsl:attribute>
                     <svrl:text>[UBL-CR-150]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Postbox</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-151">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor)</xsl:attribute>
                     <svrl:text>[UBL-CR-151]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Floor</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-152">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Room)</xsl:attribute>
                     <svrl:text>[UBL-CR-152]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Room</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-153">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName)</xsl:attribute>
                     <svrl:text>[UBL-CR-153]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BlockName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-154">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName)</xsl:attribute>
                     <svrl:text>[UBL-CR-154]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BuildingName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-155">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber)</xsl:attribute>
                     <svrl:text>[UBL-CR-155]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress BuildingNumber</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-156">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)</xsl:attribute>
                     <svrl:text>[UBL-CR-156]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress InhouseMail</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Department))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-157">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Department)</xsl:attribute>
                     <svrl:text>[UBL-CR-157]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Department</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-158">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)</xsl:attribute>
                     <svrl:text>[UBL-CR-158]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress MarkAttention</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-159">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare)</xsl:attribute>
                     <svrl:text>[UBL-CR-159]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress MarkCare</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-160">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-160]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress PlotIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-161">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)</xsl:attribute>
                     <svrl:text>[UBL-CR-161]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress CitySubdivisionName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-162">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-162]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress CountrySubentityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-163">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:Region)</xsl:attribute>
                     <svrl:text>[UBL-CR-163]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Region</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-164">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District)</xsl:attribute>
                     <svrl:text>[UBL-CR-164]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress District</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-165">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)</xsl:attribute>
                     <svrl:text>[UBL-CR-165]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress TimezoneOffset</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-166">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-166]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress Country Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-167">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)</xsl:attribute>
                     <svrl:text>[UBL-CR-167]-A UBL invoice should not include the AccountingSupplierParty Party PostalAddress LocationCoordinate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-168">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PhysicalLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-168]-A UBL invoice should not include the AccountingSupplierParty Party PhysicalLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-169">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)</xsl:attribute>
                     <svrl:text>[UBL-CR-169]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-170">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-170]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxLevelCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-171">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-171]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-172">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-172]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme ExemptionReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-173">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-173]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-174">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-174]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-175">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-175]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-176">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-176]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-177">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-177]-A UBL invoice should not include the AccountingSupplierParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-178">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-178]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-179">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-179]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationExpirationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-180">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-180]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLegalFormCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-181">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-181]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity SoleProprietorshipIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-182">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-182]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CompanyLiquidationStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-183">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-183]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporationStockAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-184">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-184]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity FullyPaidSharesIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-185">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-185]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-186">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)</xsl:attribute>
                     <svrl:text>[UBL-CR-186]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity CorporateRegistrationScheme</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-187">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-187]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity HeadOfficeParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-188">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-188]-A UBL invoice should not include the AccountingSupplierParty Party PartyLegalEntity ShareholderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-189">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-189]-A UBL invoice should not include the AccountingSupplierParty Party Contact ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-190">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax)</xsl:attribute>
                     <svrl:text>[UBL-CR-190]-A UBL invoice should not include the AccountingSupplierParty Party Contact Telefax</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-191">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Note)</xsl:attribute>
                     <svrl:text>[UBL-CR-191]-A UBL invoice should not include the AccountingSupplierParty Party Contact Note</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-192">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication)</xsl:attribute>
                     <svrl:text>[UBL-CR-192]-A UBL invoice should not include the AccountingSupplierParty Party Contact OtherCommunication</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:Person))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-193">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:Person)</xsl:attribute>
                     <svrl:text>[UBL-CR-193]-A UBL invoice should not include the AccountingSupplierParty Party Person</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:AgentParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-194">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:AgentParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-194]-A UBL invoice should not include the AccountingSupplierParty Party AgentParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:ServiceProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-195">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:ServiceProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-195]-A UBL invoice should not include the AccountingSupplierParty Party ServiceProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:PowerOfAttorney))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-196">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:PowerOfAttorney)</xsl:attribute>
                     <svrl:text>[UBL-CR-196]-A UBL invoice should not include the AccountingSupplierParty Party PowerOfAttorney</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:Party/cac:FinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-197">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:Party/cac:FinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-197]-A UBL invoice should not include the AccountingSupplierParty Party FinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:DespatchContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-198">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:DespatchContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-198]-A UBL invoice should not include the AccountingSupplierParty DespatchContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:AccountingContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-199">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:AccountingContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-199]-A UBL invoice should not include the AccountingSupplierParty AccountingContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingSupplierParty/cac:SellerContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-200">
                     <xsl:attribute name="test">not(cac:AccountingSupplierParty/cac:SellerContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-200]-A UBL invoice should not include the AccountingSupplierParty SellerContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-201">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID)</xsl:attribute>
                     <svrl:text>[UBL-CR-201]-A UBL invoice should not include the AccountingCustomerParty CustomerAssignedAccountID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-202">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cbc:SupplierAssignedAccountID)</xsl:attribute>
                     <svrl:text>[UBL-CR-202]-A UBL invoice should not include the AccountingCustomerParty SupplierAssignedAccountID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cbc:AdditionalAccountID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-203">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cbc:AdditionalAccountID)</xsl:attribute>
                     <svrl:text>[UBL-CR-203]-A UBL invoice should not include the AccountingCustomerParty AdditionalAccountID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-204">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cbc:MarkCareIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-204]-A UBL invoice should not include the AccountingCustomerParty Party MarkCareIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-205">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cbc:MarkAttentionIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-205]-A UBL invoice should not include the AccountingCustomerParty Party MarkAttentionIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-206">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-206]-A UBL invoice should not include the AccountingCustomerParty Party WebsiteURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-207">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cbc:LogoReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-207]-A UBL invoice should not include the AccountingCustomerParty Party LogoReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-208">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cbc:IndustryClassificationCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-208]-A UBL invoice should not include the AccountingCustomerParty Party IndustryClassificationCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Language))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-209">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Language)</xsl:attribute>
                     <svrl:text>[UBL-CR-209]-A UBL invoice should not include the AccountingCustomerParty Party Language</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-210">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-210]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-211">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-211]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress AddressTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-212">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-212]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress AddressFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-213">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Postbox)</xsl:attribute>
                     <svrl:text>[UBL-CR-213]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Postbox</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-214">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor)</xsl:attribute>
                     <svrl:text>[UBL-CR-214]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Floor</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-215">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Room)</xsl:attribute>
                     <svrl:text>[UBL-CR-215]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Room</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-216">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName)</xsl:attribute>
                     <svrl:text>[UBL-CR-216]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BlockName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-217">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName)</xsl:attribute>
                     <svrl:text>[UBL-CR-217]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BuildingName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-218">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber)</xsl:attribute>
                     <svrl:text>[UBL-CR-218]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress BuildingNumber</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-219">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail)</xsl:attribute>
                     <svrl:text>[UBL-CR-219]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress InhouseMail</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-220">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Department)</xsl:attribute>
                     <svrl:text>[UBL-CR-220]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Department</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-221">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention)</xsl:attribute>
                     <svrl:text>[UBL-CR-221]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress MarkAttention</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-222">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare)</xsl:attribute>
                     <svrl:text>[UBL-CR-222]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress MarkCare</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-223">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-223]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress PlotIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-224">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName)</xsl:attribute>
                     <svrl:text>[UBL-CR-224]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress CitySubdivisionName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-225">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-225]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress CountrySubentityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-226">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:Region)</xsl:attribute>
                     <svrl:text>[UBL-CR-226]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Region</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-227">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District)</xsl:attribute>
                     <svrl:text>[UBL-CR-227]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress District</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-228">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset)</xsl:attribute>
                     <svrl:text>[UBL-CR-228]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress TimezoneOffset</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-229">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-229]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress Country Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-230">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate)</xsl:attribute>
                     <svrl:text>[UBL-CR-230]-A UBL invoice should not include the AccountingCustomerParty Party PostalAddress LocationCoordinate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-231">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-231]-A UBL invoice should not include the AccountingCustomerParty Party PhysicalLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-232">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:RegistrationName)</xsl:attribute>
                     <svrl:text>[UBL-CR-232]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-233">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-233]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxLevelCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-234">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-234]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-235">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-235]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme ExemptionReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-236">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-236]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-237">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-237]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-238">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-238]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-239">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-239]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-240">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-240]-A UBL invoice should not include the AccountingCustomerParty Party PartyTaxScheme TaxScheme JurisdictionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-241">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-241]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-242">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-242]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationExpirationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-243">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-243]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalFormCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-244">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm)</xsl:attribute>
                     <svrl:text>[UBL-CR-244]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLegalForm</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-245">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-245]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity SoleProprietorshipIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-246">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-246]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CompanyLiquidationStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-247">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporationStockAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-247]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporationStockAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-248">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-248]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity FullyPaidSharesIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-249">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-249]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-250">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)</xsl:attribute>
                     <svrl:text>[UBL-CR-250]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity CorporateRegistrationScheme</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-251">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadOfficeParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-251]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity HeadOfficeParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-252">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-252]-A UBL invoice should not include the AccountingCustomerParty Party PartyLegalEntity ShareholderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-253">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-253]-A UBL invoice should not include the AccountingCustomerParty Party Contact ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-254">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax)</xsl:attribute>
                     <svrl:text>[UBL-CR-254]-A UBL invoice should not include the AccountingCustomerParty Party Contact Telefax</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-255">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Note)</xsl:attribute>
                     <svrl:text>[UBL-CR-255]-A UBL invoice should not include the AccountingCustomerParty Party Contact Note</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-256">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication)</xsl:attribute>
                     <svrl:text>[UBL-CR-256]-A UBL invoice should not include the AccountingCustomerParty Party Contact OtherCommunication</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:Person))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-257">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:Person)</xsl:attribute>
                     <svrl:text>[UBL-CR-257]-A UBL invoice should not include the AccountingCustomerParty Party Person</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:AgentParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-258">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:AgentParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-258]-A UBL invoice should not include the AccountingCustomerParty Party AgentParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-259">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:ServiceProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-259]-A UBL invoice should not include the AccountingCustomerParty Party ServiceProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-260">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:PowerOfAttorney)</xsl:attribute>
                     <svrl:text>[UBL-CR-260]-A UBL invoice should not include the AccountingCustomerParty Party PowerOfAttorney</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-261">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:Party/cac:FinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-261]-A UBL invoice should not include the AccountingCustomerParty Party FinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:DeliveryContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-262">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:DeliveryContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-262]-A UBL invoice should not include the AccountingCustomerParty DeliveryContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:AccountingContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-263">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:AccountingContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-263]-A UBL invoice should not include the AccountingCustomerParty AccountingContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AccountingCustomerParty/cac:BuyerContact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-264">
                     <xsl:attribute name="test">not(cac:AccountingCustomerParty/cac:BuyerContact)</xsl:attribute>
                     <svrl:text>[UBL-CR-264]-A UBL invoice should not include the AccountingCustomerParty BuyerContact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:MarkCareIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-265">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:MarkCareIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-265]-A UBL invoice should not include the PayeeParty MarkCareIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:MarkAttentionIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-266">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:MarkAttentionIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-266]-A UBL invoice should not include the PayeeParty MarkAttentionIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:WebsiteURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-267">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:WebsiteURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-267]-A UBL invoice should not include the PayeeParty WebsiteURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:LogoReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-268">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:LogoReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-268]-A UBL invoice should not include the PayeeParty LogoReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:EndpointID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-269">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:EndpointID)</xsl:attribute>
                     <svrl:text>[UBL-CR-269]-A UBL invoice should not include the PayeeParty EndpointID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cbc:IndustryClassificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-270">
                     <xsl:attribute name="test">not(cac:PayeeParty/cbc:IndustryClassificationCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-270]-A UBL invoice should not include the PayeeParty IndustryClassificationCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:Language))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-271">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:Language)</xsl:attribute>
                     <svrl:text>[UBL-CR-271]-A UBL invoice should not include the PayeeParty Language</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PostalAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-272">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PostalAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-272]-A UBL invoice should not include the PayeeParty PostalAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PhysicalLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-273">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PhysicalLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-273]-A UBL invoice should not include the PayeeParty PhysicalLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyTaxScheme))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-274">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyTaxScheme)</xsl:attribute>
                     <svrl:text>[UBL-CR-274]-A UBL invoice should not include the PayeeParty PartyTaxScheme</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-275">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationName)</xsl:attribute>
                     <svrl:text>[UBL-CR-275]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-276">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-276]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-277">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-277]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationExpirationDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-278">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-278]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLegalFormCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalForm))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-279">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLegalForm)</xsl:attribute>
                     <svrl:text>[UBL-CR-279]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLegalForm</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-280">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-280]-A UBL invoice should not include the PayeeParty PartyLegalEntity SoleProprietorshipIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-281">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-281]-A UBL invoice should not include the PayeeParty PartyLegalEntity CompanyLiquidationStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporationStockAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-282">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:CorporationStockAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-282]-A UBL invoice should not include the PayeeParty PartyLegalEntity CorporationStockAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-283">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-283]-A UBL invoice should not include the PayeeParty PartyLegalEntity FullyPaidSharesIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-284">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-284]-A UBL invoice should not include the PayeeParty PartyLegalEntity RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-285">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme)</xsl:attribute>
                     <svrl:text>[UBL-CR-285]-A UBL invoice should not include the PayeeParty PartyLegalEntity CorporateRegistrationScheme</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cac:HeadOfficeParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-286">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cac:HeadOfficeParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-286]-A UBL invoice should not include the PayeeParty PartyLegalEntity HeadOfficeParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-287">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PartyLegalEntity/cac:ShareholderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-287]-A UBL invoice should not include the PayeeParty PartyLegalEntity ShareholderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:Contact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-288">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:Contact)</xsl:attribute>
                     <svrl:text>[UBL-CR-288]-A UBL invoice should not include the PayeeParty Contact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:Person))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-289">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:Person)</xsl:attribute>
                     <svrl:text>[UBL-CR-289]-A UBL invoice should not include the PayeeParty Person</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:AgentParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-290">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:AgentParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-290]-A UBL invoice should not include the PayeeParty AgentParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:ServiceProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-291">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:ServiceProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-291]-A UBL invoice should not include the PayeeParty ServiceProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:PowerOfAttorney))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-292">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:PowerOfAttorney)</xsl:attribute>
                     <svrl:text>[UBL-CR-292]-A UBL invoice should not include the PayeeParty PowerOfAttorney</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PayeeParty/cac:FinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-293">
                     <xsl:attribute name="test">not(cac:PayeeParty/cac:FinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-293]-A UBL invoice should not include the PayeeParty FinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:BuyerCustomerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-294">
                     <xsl:attribute name="test">not(cac:BuyerCustomerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-294]-A UBL invoice should not include the BuyerCustomerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:SellerSupplierParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-295">
                     <xsl:attribute name="test">not(cac:SellerSupplierParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-295]-A UBL invoice should not include the SellerSupplierParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:MarkCareIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-296">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:MarkCareIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-296]-A UBL invoice should not include the TaxRepresentativeParty MarkCareIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-297">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:MarkAttentionIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-297]-A UBL invoice should not include the TaxRepresentativeParty MarkAttentionIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:WebsiteURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-298">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:WebsiteURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-298]-A UBL invoice should not include the TaxRepresentativeParty WebsiteURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:LogoReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-299">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:LogoReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-299]-A UBL invoice should not include the TaxRepresentativeParty LogoReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:EndpointID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-300">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:EndpointID)</xsl:attribute>
                     <svrl:text>[UBL-CR-300]-A UBL invoice should not include the TaxRepresentativeParty EndpointID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cbc:IndustryClassificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-301">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cbc:IndustryClassificationCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-301]-A UBL invoice should not include the TaxRepresentativeParty IndustryClassificationCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-302">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-302]-A UBL invoice should not include the TaxRepresentativeParty PartyIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:Language))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-303">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:Language)</xsl:attribute>
                     <svrl:text>[UBL-CR-303]-A UBL invoice should not include the TaxRepresentativeParty Language</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-304">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-304]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-305">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-305]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress AddressTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-306">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:AddressFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-306]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress AddressFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Postbox))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-307">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Postbox)</xsl:attribute>
                     <svrl:text>[UBL-CR-307]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Postbox</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Floor))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-308">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Floor)</xsl:attribute>
                     <svrl:text>[UBL-CR-308]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Floor</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Room))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-309">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Room)</xsl:attribute>
                     <svrl:text>[UBL-CR-309]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Room</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BlockName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-310">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BlockName)</xsl:attribute>
                     <svrl:text>[UBL-CR-310]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BlockName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-311">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingName)</xsl:attribute>
                     <svrl:text>[UBL-CR-311]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BuildingName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingNumber))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-312">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:BuildingNumber)</xsl:attribute>
                     <svrl:text>[UBL-CR-312]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress BuildingNumber</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:InhouseMail))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-313">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:InhouseMail)</xsl:attribute>
                     <svrl:text>[UBL-CR-313]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress InhouseMail</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Department))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-314">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Department)</xsl:attribute>
                     <svrl:text>[UBL-CR-314]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Department</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkAttention))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-315">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkAttention)</xsl:attribute>
                     <svrl:text>[UBL-CR-315]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress MarkAttention</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkCare))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-316">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:MarkCare)</xsl:attribute>
                     <svrl:text>[UBL-CR-316]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress MarkCare</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PlotIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-317">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:PlotIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-317]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress PlotIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CitySubdivisionName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-318">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CitySubdivisionName)</xsl:attribute>
                     <svrl:text>[UBL-CR-318]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress CitySubdivisionName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-319">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:CountrySubentityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-319]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress CountrySubentityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Region))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-320">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:Region)</xsl:attribute>
                     <svrl:text>[UBL-CR-320]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Region</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:District))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-321">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:District)</xsl:attribute>
                     <svrl:text>[UBL-CR-321]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress District</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:TimezoneOffset))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-322">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cbc:TimezoneOffset)</xsl:attribute>
                     <svrl:text>[UBL-CR-322]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress TimezoneOffset</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-323">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:Country/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-323]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress Country Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:LocationCoordinate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-324">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PostalAddress/cac:LocationCoordinate)</xsl:attribute>
                     <svrl:text>[UBL-CR-324]-A UBL invoice should not include the TaxRepresentativeParty PostalAddress LocationCoordinate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PhysicalLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-325">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PhysicalLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-325]-A UBL invoice should not include the TaxRepresentativeParty PhysicalLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-326">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:RegistrationName)</xsl:attribute>
                     <svrl:text>[UBL-CR-326]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-327">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:TaxLevelCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-327]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxLevelCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-328">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-328]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-329">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-329]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme ExemptionReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-330">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:RegistrationAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-330]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme RegistrationAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-331">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-331]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-332">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-332]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-333">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-333]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-334">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-334]-A UBL invoice should not include the TaxRepresentativeParty PartyTaxScheme TaxScheme JurisdictionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PartyLegalEntity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-335">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PartyLegalEntity)</xsl:attribute>
                     <svrl:text>[UBL-CR-335]-A UBL invoice should not include the TaxRepresentativeParty PartyLegalEntity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:Contact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-336">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:Contact)</xsl:attribute>
                     <svrl:text>[UBL-CR-336]-A UBL invoice should not include the TaxRepresentativeParty Contact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:Person))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-337">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:Person)</xsl:attribute>
                     <svrl:text>[UBL-CR-337]-A UBL invoice should not include the TaxRepresentativeParty Person</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:AgentParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-338">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:AgentParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-338]-A UBL invoice should not include the TaxRepresentativeParty AgentParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:ServiceProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-339">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:ServiceProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-339]-A UBL invoice should not include the TaxRepresentativeParty ServiceProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:PowerOfAttorney))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-340">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:PowerOfAttorney)</xsl:attribute>
                     <svrl:text>[UBL-CR-340]-A UBL invoice should not include the TaxRepresentativeParty PowerOfAttorney</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxRepresentativeParty/cac:FinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-341">
                     <xsl:attribute name="test">not(cac:TaxRepresentativeParty/cac:FinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-341]-A UBL invoice should not include the TaxRepresentativeParty FinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-342">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-342]-A UBL invoice should not include the Delivery ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:Quantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-343">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:Quantity)</xsl:attribute>
                     <svrl:text>[UBL-CR-343]-A UBL invoice should not include the Delivery Quantity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:MinimumQuantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-344">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:MinimumQuantity)</xsl:attribute>
                     <svrl:text>[UBL-CR-344]-A UBL invoice should not include the Delivery MinimumQuantity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:MaximumQuantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-345">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:MaximumQuantity)</xsl:attribute>
                     <svrl:text>[UBL-CR-345]-A UBL invoice should not include the Delivery MaximumQuantity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:ActualDeliveryTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-346">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:ActualDeliveryTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-346]-A UBL invoice should not include the Delivery ActualDeliveryTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:LatestDeliveryDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-347">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:LatestDeliveryDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-347]-A UBL invoice should not include the Delivery LatestDeliveryDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:LatestDeliveryTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-348">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:LatestDeliveryTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-348]-A UBL invoice should not include the Delivery LatestDeliveryTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:ReleaseID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-349">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:ReleaseID)</xsl:attribute>
                     <svrl:text>[UBL-CR-349]-A UBL invoice should not include the Delivery ReleaseID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cbc:TrackingID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-350">
                     <xsl:attribute name="test">not(cac:Delivery/cbc:TrackingID)</xsl:attribute>
                     <svrl:text>[UBL-CR-350]-A UBL invoice should not include the Delivery TrackingID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:Description))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-351">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:Description)</xsl:attribute>
                     <svrl:text>[UBL-CR-351]-A UBL invoice should not include the Delivery DeliveryLocation Description</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-352">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions)</xsl:attribute>
                     <svrl:text>[UBL-CR-352]-A UBL invoice should not include the Delivery DeliveryLocation Conditions</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-353">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity)</xsl:attribute>
                     <svrl:text>[UBL-CR-353]-A UBL invoice should not include the Delivery DeliveryLocation CountrySubentity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-354">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-354]-A UBL invoice should not include the Delivery DeliveryLocation CountrySubentityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-355">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:LocationTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-355]-A UBL invoice should not include the Delivery DeliveryLocation LocationTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:InformationURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-356">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:InformationURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-356]-A UBL invoice should not include the Delivery DeliveryLocation InformationURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-357">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-357]-A UBL invoice should not include the Delivery DeliveryLocation Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:ValidationPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-358">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:ValidationPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-358]-A UBL invoice should not include the Delivery DeliveryLocation ValidationPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-359">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-359]-A UBL invoice should not include the Delivery DeliveryLocation Address ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-360">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-360]-A UBL invoice should not include the Delivery DeliveryLocation Address AddressTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-361">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-361]-A UBL invoice should not include the Delivery DeliveryLocation Address AddressFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-362">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Postbox)</xsl:attribute>
                     <svrl:text>[UBL-CR-362]-A UBL invoice should not include the Delivery DeliveryLocation Address Postbox</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-363">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor)</xsl:attribute>
                     <svrl:text>[UBL-CR-363]-A UBL invoice should not include the Delivery DeliveryLocation Address Floor</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-364">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room)</xsl:attribute>
                     <svrl:text>[UBL-CR-364]-A UBL invoice should not include the Delivery DeliveryLocation Address Room</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-365">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName)</xsl:attribute>
                     <svrl:text>[UBL-CR-365]-A UBL invoice should not include the Delivery DeliveryLocation Address BlockName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-366">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName)</xsl:attribute>
                     <svrl:text>[UBL-CR-366]-A UBL invoice should not include the Delivery DeliveryLocation Address BuildingName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-367">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingNumber)</xsl:attribute>
                     <svrl:text>[UBL-CR-367]-A UBL invoice should not include the Delivery DeliveryLocation Address BuildingNumber</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-368">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail)</xsl:attribute>
                     <svrl:text>[UBL-CR-368]-A UBL invoice should not include the Delivery DeliveryLocation Address InhouseMail</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-369">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department)</xsl:attribute>
                     <svrl:text>[UBL-CR-369]-A UBL invoice should not include the Delivery DeliveryLocation Address Department</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-370">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention)</xsl:attribute>
                     <svrl:text>[UBL-CR-370]-A UBL invoice should not include the Delivery DeliveryLocation Address MarkAttention</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-371">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare)</xsl:attribute>
                     <svrl:text>[UBL-CR-371]-A UBL invoice should not include the Delivery DeliveryLocation Address MarkCare</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-372">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-372]-A UBL invoice should not include the Delivery DeliveryLocation Address PlotIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-373">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName)</xsl:attribute>
                     <svrl:text>[UBL-CR-373]-A UBL invoice should not include the Delivery DeliveryLocation Address CitySubdivisionName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-374">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-374]-A UBL invoice should not include the Delivery DeliveryLocation Address CountrySubentityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-375">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region)</xsl:attribute>
                     <svrl:text>[UBL-CR-375]-A UBL invoice should not include the Delivery DeliveryLocation Address Region</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-376">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District)</xsl:attribute>
                     <svrl:text>[UBL-CR-376]-A UBL invoice should not include the Delivery DeliveryLocation Address District</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-377">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset)</xsl:attribute>
                     <svrl:text>[UBL-CR-377]-A UBL invoice should not include the Delivery DeliveryLocation Address TimezoneOffset</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-378">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-378]-A UBL invoice should not include the Delivery DeliveryLocation Address Country Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-379">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate)</xsl:attribute>
                     <svrl:text>[UBL-CR-379]-A UBL invoice should not include the Delivery DeliveryLocation Address LocationCoordinate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-380">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:SubsidiaryLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-380]-A UBL invoice should not include the Delivery DeliveryLocation SubsidiaryLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-381">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:LocationCoordinate)</xsl:attribute>
                     <svrl:text>[UBL-CR-381]-A UBL invoice should not include the Delivery DeliveryLocation LocationCoordinate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:AlternativeDeliveryLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-382">
                     <xsl:attribute name="test">not(cac:Delivery/cac:AlternativeDeliveryLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-382]-A UBL invoice should not include the Delivery AlternativeDeliveryLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-383">
                     <xsl:attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-383]-A UBL invoice should not include the Delivery RequestedDeliveryPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:PromisedDeliveryPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-384">
                     <xsl:attribute name="test">not(cac:Delivery/cac:PromisedDeliveryPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-384]-A UBL invoice should not include the Delivery PromisedDeliveryPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:CarrierParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-385">
                     <xsl:attribute name="test">not(cac:Delivery/cac:CarrierParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-385]-A UBL invoice should not include the Delivery CarrierParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-386">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-386]-A UBL invoice should not include the DeliveryParty MarkCareIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-387">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-387]-A UBL invoice should not include the DeliveryParty MarkAttentionIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-388">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-388]-A UBL invoice should not include the DeliveryParty WebsiteURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-389">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-389]-A UBL invoice should not include the DeliveryParty LogoReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:EndpointID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-390">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:EndpointID)</xsl:attribute>
                     <svrl:text>[UBL-CR-390]-A UBL invoice should not include the DeliveryParty EndpointID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:IndustryClassificationCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-391">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:IndustryClassificationCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-391]-A UBL invoice should not include the DeliveryParty IndustryClassificationCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PartyIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-392">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PartyIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-392]-A UBL invoice should not include the DeliveryParty PartyIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Language))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-393">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Language)</xsl:attribute>
                     <svrl:text>[UBL-CR-393]-A UBL invoice should not include the DeliveryParty Language</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-394">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-394]-A UBL invoice should not include the DeliveryParty PostalAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-395">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation)</xsl:attribute>
                     <svrl:text>[UBL-CR-395]-A UBL invoice should not include the DeliveryParty PhysicalLocation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-396">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme)</xsl:attribute>
                     <svrl:text>[UBL-CR-396]-A UBL invoice should not include the DeliveryParty PartyTaxScheme</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-397">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity)</xsl:attribute>
                     <svrl:text>[UBL-CR-397]-A UBL invoice should not include the DeliveryParty PartyLegalEntity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Contact))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-398">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Contact)</xsl:attribute>
                     <svrl:text>[UBL-CR-398]-A UBL invoice should not include the DeliveryParty Contact</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Person))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-399">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Person)</xsl:attribute>
                     <svrl:text>[UBL-CR-399]-A UBL invoice should not include the DeliveryParty Person</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:AgentParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-400">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:AgentParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-400]-A UBL invoice should not include the DeliveryParty AgentParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:ServiceProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-401">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:ServiceProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-401]-A UBL invoice should not include the DeliveryParty ServiceProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PowerOfAttorney))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-402">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PowerOfAttorney)</xsl:attribute>
                     <svrl:text>[UBL-CR-402]-A UBL invoice should not include the DeliveryParty PowerOfAttorney</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryParty/cac:FinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-403">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:FinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-403]-A UBL invoice should not include the DeliveryParty FinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:NotifyParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-404">
                     <xsl:attribute name="test">not(cac:Delivery/cac:NotifyParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-404]-A UBL invoice should not include the Delivery NotifyParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:Despatch))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-405">
                     <xsl:attribute name="test">not(cac:Delivery/cac:Despatch)</xsl:attribute>
                     <svrl:text>[UBL-CR-405]-A UBL invoice should not include the Delivery Despatch</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:DeliveryTerms))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-406">
                     <xsl:attribute name="test">not(cac:Delivery/cac:DeliveryTerms)</xsl:attribute>
                     <svrl:text>[UBL-CR-406]-A UBL invoice should not include the Delivery DeliveryTerms</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:MinimumDeliveryUnit))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-407">
                     <xsl:attribute name="test">not(cac:Delivery/cac:MinimumDeliveryUnit)</xsl:attribute>
                     <svrl:text>[UBL-CR-407]-A UBL invoice should not include the Delivery MinimumDeliveryUnit</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:MaximumDeliveryUnit))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-408">
                     <xsl:attribute name="test">not(cac:Delivery/cac:MaximumDeliveryUnit)</xsl:attribute>
                     <svrl:text>[UBL-CR-408]-A UBL invoice should not include the Delivery MaximumDeliveryUnit</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:Delivery/cac:Shipment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-409">
                     <xsl:attribute name="test">not(cac:Delivery/cac:Shipment)</xsl:attribute>
                     <svrl:text>[UBL-CR-409]-A UBL invoice should not include the Delivery Shipment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:DeliveryTerms))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-410">
                     <xsl:attribute name="test">not(cac:DeliveryTerms)</xsl:attribute>
                     <svrl:text>[UBL-CR-410]-A UBL invoice should not include the DeliveryTerms</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-411">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-411]-A UBL invoice should not include the PaymentMeans ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:PaymentDueDate) or ../cn:CreditNote)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-412">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:PaymentDueDate) or ../cn:CreditNote</xsl:attribute>
                     <svrl:text>[UBL-CR-412]-A UBL invoice should not include the PaymentMeans PaymentDueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:PaymentChannelCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-413">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:PaymentChannelCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-413]-A UBL invoice should not include the PaymentMeans PaymentChannelCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:InstructionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-414">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:InstructionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-414]-A UBL invoice should not include the PaymentMeans InstructionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:CardTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-415">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:CardTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-415]-A UBL invoice should not include the PaymentMeans CardAccount CardTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:ValidityStartDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-416">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:ValidityStartDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-416]-A UBL invoice should not include the PaymentMeans CardAccount ValidityStartDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:ExpiryDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-417">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:ExpiryDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-417]-A UBL invoice should not include the PaymentMeans CardAccount ExpiryDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-418">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerID)</xsl:attribute>
                     <svrl:text>[UBL-CR-418]-A UBL invoice should not include the PaymentMeans CardAccount IssuerID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerNumberID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-419">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:IssuerNumberID)</xsl:attribute>
                     <svrl:text>[UBL-CR-419]-A UBL invoice should not include the PaymentMeans CardAccount IssuerNumberID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:CV2ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-420">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:CV2ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-420]-A UBL invoice should not include the PaymentMeans CardAccount CV2ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:CardChipCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-421">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:CardChipCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-421]-A UBL invoice should not include the PaymentMeans CardAccount CardChipCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CardAccount/cbc:ChipApplicationID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-422">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CardAccount/cbc:ChipApplicationID)</xsl:attribute>
                     <svrl:text>[UBL-CR-422]-A UBL invoice should not include the PaymentMeans CardAccount ChipApplicationID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AliasName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-424">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AliasName)</xsl:attribute>
                     <svrl:text>[UBL-CR-424]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AliasName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-425">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-425]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AccountTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-426">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:AccountFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-426]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount AccountFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-427">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-427]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-428">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote)</xsl:attribute>
                     <svrl:text>[UBL-CR-428]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount PaymentNote</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-429">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-429]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-430">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-430]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-431">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cac:Address)</xsl:attribute>
                     <svrl:text>[UBL-CR-431]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch FinancialInstitution Address</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-432">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:Address)</xsl:attribute>
                     <svrl:text>[UBL-CR-432]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount FinancialInstitutionBranch Address</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-433">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:Country)</xsl:attribute>
                     <svrl:text>[UBL-CR-433]-A UBL invoice should not include the PaymentMeans PayeeFinancialAccount Country</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:CreditAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-434">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:CreditAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-434]-A UBL invoice should not include the PaymentMeans CreditAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cbc:MandateTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-435">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cbc:MandateTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-435]-A UBL invoice should not include the PaymentMeans PaymentMandate MandateTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaymentInstructionsNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-436">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaymentInstructionsNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-436]-A UBL invoice should not include the PaymentMeans PaymentMandate MaximumPaymentInstructionsNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaidAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-437">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cbc:MaximumPaidAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-437]-A UBL invoice should not include the PaymentMeans PaymentMandate MaximumPaidAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cbc:SignatureID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-438">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cbc:SignatureID)</xsl:attribute>
                     <svrl:text>[UBL-CR-438]-A UBL invoice should not include the PaymentMeans PaymentMandate SignatureID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-439">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-439]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-440">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-440]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AliasName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-441">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AliasName)</xsl:attribute>
                     <svrl:text>[UBL-CR-441]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AliasName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-442">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-442]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountFormatCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-443">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:AccountFormatCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-443]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount AccountFormatCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-444">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-444]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:PaymentNote))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-445">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cbc:PaymentNote)</xsl:attribute>
                     <svrl:text>[UBL-CR-445]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount PaymentNote</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:FinancialInstitutionBranch))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-446">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:FinancialInstitutionBranch)</xsl:attribute>
                     <svrl:text>[UBL-CR-446]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount FinancialInstitutionBranch</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:Country))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-447">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PayerFinancialAccount/cac:Country)</xsl:attribute>
                     <svrl:text>[UBL-CR-447]-A UBL invoice should not include the PaymentMeans PaymentMandate PayerFinancialAccount Country</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-448">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-448]-A UBL invoice should not include the PaymentMeans PaymentMandate ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:PaymentReversalPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-449">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:PaymentReversalPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-449]-A UBL invoice should not include the PaymentMeans PaymentMandate PaymentReversalPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PaymentMandate/cac:Clause))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-450">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PaymentMandate/cac:Clause)</xsl:attribute>
                     <svrl:text>[UBL-CR-450]-A UBL invoice should not include the PaymentMeans PaymentMandate Clause</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:TradeFinancing))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-451">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:TradeFinancing)</xsl:attribute>
                     <svrl:text>[UBL-CR-451]-A UBL invoice should not include the PaymentMeans TradeFinancing</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-452">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-452]-A UBL invoice should not include the PaymentTerms ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PaymentMeansID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-453">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PaymentMeansID)</xsl:attribute>
                     <svrl:text>[UBL-CR-453]-A UBL invoice should not include the PaymentTerms PaymentMeansID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PrepaidPaymentReferenceID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-454">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PrepaidPaymentReferenceID)</xsl:attribute>
                     <svrl:text>[UBL-CR-454]-A UBL invoice should not include the PaymentTerms PrepaidPaymentReferenceID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:ReferenceEventCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-455">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:ReferenceEventCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-455]-A UBL invoice should not include the PaymentTerms ReferenceEventCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:SettlementDiscountPercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-456">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:SettlementDiscountPercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-456]-A UBL invoice should not include the PaymentTerms SettlementDiscountPercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PenaltySurchargePercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-457">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PenaltySurchargePercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-457]-A UBL invoice should not include the PaymentTerms PenaltySurchargePercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PaymentPercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-458">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PaymentPercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-458]-A UBL invoice should not include the PaymentTerms PaymentPercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:Amount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-459">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:Amount)</xsl:attribute>
                     <svrl:text>[UBL-CR-459]-A UBL invoice should not include the PaymentTerms Amount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:SettlementDiscountAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-460">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:SettlementDiscountAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-460]-A UBL invoice should not include the PaymentTerms SettlementDiscountAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PenaltyAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-461">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PenaltyAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-461]-A UBL invoice should not include the PaymentTerms PenaltyAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PaymentTermsDetailsURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-462">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PaymentTermsDetailsURI)</xsl:attribute>
                     <svrl:text>[UBL-CR-462]-A UBL invoice should not include the PaymentTerms PaymentTermsDetailsURI</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:PaymentDueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-463">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:PaymentDueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-463]-A UBL invoice should not include the PaymentTerms PaymentDueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:InstallmentDueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-464">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:InstallmentDueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-464]-A UBL invoice should not include the PaymentTerms InstallmentDueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cbc:InvoicingPartyReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-465">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cbc:InvoicingPartyReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-465]-A UBL invoice should not include the PaymentTerms InvoicingPartyReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cac:SettlementPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-466">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cac:SettlementPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-466]-A UBL invoice should not include the PaymentTerms SettlementPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cac:PenaltyPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-467">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cac:PenaltyPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-467]-A UBL invoice should not include the PaymentTerms PenaltyPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cac:ExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-468">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cac:ExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-468]-A UBL invoice should not include the PaymentTerms ExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentTerms/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-469">
                     <xsl:attribute name="test">not(cac:PaymentTerms/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-469]-A UBL invoice should not include the PaymentTerms ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PrepaidPayment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-470">
                     <xsl:attribute name="test">not(cac:PrepaidPayment)</xsl:attribute>
                     <svrl:text>[UBL-CR-470]-A UBL invoice should not include the PrepaidPayment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-471">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-471]-A UBL invoice should not include the AllowanceCharge ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:PrepaidIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-472">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:PrepaidIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-472]-A UBL invoice should not include the AllowanceCharge PrepaidIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:SequenceNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-473">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:SequenceNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-473]-A UBL invoice should not include the AllowanceCharge SequenceNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:AccountingCostCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-474">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:AccountingCostCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-474]-A UBL invoice should not include the AllowanceCharge AccountingCostCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:AccountingCost))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-475">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:AccountingCost)</xsl:attribute>
                     <svrl:text>[UBL-CR-475]-A UBL invoice should not include the AllowanceCharge AccountingCost</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-476">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-476]-A UBL invoice should not include the AllowanceCharge PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-477">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-477]-A UBL invoice should not include the AllowanceCharge TaxCategory Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-478">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:BaseUnitMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-478]-A UBL invoice should not include the AllowanceCharge TaxCategory BaseUnitMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-479">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-479]-A UBL invoice should not include the AllowanceCharge TaxCategory PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-480">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-480]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxExemptionReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-481">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:TaxExemptionReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-481]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxExemptionReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-482">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRange)</xsl:attribute>
                     <svrl:text>[UBL-CR-482]-A UBL invoice should not include the AllowanceCharge TaxCategory TierRange</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-483">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cbc:TierRatePercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-483]-A UBL invoice should not include the AllowanceCharge TaxCategory TierRatePercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-484">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-484]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-485">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-485]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-486">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-486]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-487">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-487]-A UBL invoice should not include the AllowanceCharge TaxCategory TaxScheme JurisdiccionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:TaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-488">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:TaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-488]-A UBL invoice should not include the AllowanceCharge TaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AllowanceCharge/cac:PaymentMeans))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-489">
                     <xsl:attribute name="test">not(cac:AllowanceCharge/cac:PaymentMeans)</xsl:attribute>
                     <svrl:text>[UBL-CR-489]-A UBL invoice should not include the AllowanceCharge PaymentMeans</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-490">
                     <xsl:attribute name="test">not(cac:TaxExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-490]-A UBL invoice should not include the TaxExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PricingExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-491">
                     <xsl:attribute name="test">not(cac:PricingExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-491]-A UBL invoice should not include the PricingExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-492">
                     <xsl:attribute name="test">not(cac:PaymentExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-492]-A UBL invoice should not include the PaymentExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentAlternativeExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-493">
                     <xsl:attribute name="test">not(cac:PaymentAlternativeExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-493]-A UBL invoice should not include the PaymentAlternativeExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cbc:RoundingAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-494">
                     <xsl:attribute name="test">not(cac:TaxTotal/cbc:RoundingAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-494]-A UBL invoice should not include the TaxTotal RoundingAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cbc:TaxEvidenceIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-495">
                     <xsl:attribute name="test">not(cac:TaxTotal/cbc:TaxEvidenceIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-495]-A UBL invoice should not include the TaxTotal TaxEvidenceIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cbc:TaxIncludedIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-496">
                     <xsl:attribute name="test">not(cac:TaxTotal/cbc:TaxIncludedIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-496]-A UBL invoice should not include the TaxTotal TaxIncludedIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-497">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:CalculationSequenceNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-497]-A UBL invoice should not include the TaxTotal TaxSubtotal CalulationSequenceNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-498">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:TransactionCurrencyTaxAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-498]-A UBL invoice should not include the TaxTotal TaxSubtotal TransactionCurrencyTaxAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:Percent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-499">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:Percent)</xsl:attribute>
                     <svrl:text>[UBL-CR-499]-A UBL invoice should not include the TaxTotal TaxSubtotal Percent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-500">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:BaseUnitMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-500]-A UBL invoice should not include the TaxTotal TaxSubtotal BaseUnitMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-501">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-501]-A UBL invoice should not include the TaxTotal TaxSubtotal PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-502">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRange)</xsl:attribute>
                     <svrl:text>[UBL-CR-502]-A UBL invoice should not include the TaxTotal TaxSubtotal TierRange</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-503">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cbc:TierRatePercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-503]-A UBL invoice should not include the TaxTotal TaxSubtotal TierRatePercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-504">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-504]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-505">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:BaseUnitMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-505]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory BaseUnitMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-506">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-506]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-507">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRange)</xsl:attribute>
                     <svrl:text>[UBL-CR-507]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRange</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-508">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TierRatePercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-508]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TierRatePercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-509">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-509]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-510">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-510]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-511">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-511]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-512">
                     <xsl:attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-512]-A UBL invoice should not include the TaxTotal TaxSubtotal TaxCategory TaxScheme JurisdiccionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:WithholdingTaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-513">
                     <xsl:attribute name="test">not(cac:WithholdingTaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-513]-A UBL invoice should not include the WithholdingTaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-514">
                     <xsl:attribute name="test">not(cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-514]-A UBL invoice should not include the LegalMonetaryTotal PayableAlternativeAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-515">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-515]-A UBL invoice should not include the InvoiceLine UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:TaxPointDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-516">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:TaxPointDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-516]-A UBL invoice should not include the InvoiceLine TaxPointDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:AccountingCostCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-517">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:AccountingCostCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-517]-A UBL invoice should not include the InvoiceLine AccountingCostCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:PaymentPurposeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-518">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:PaymentPurposeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-518]-A UBL invoice should not include the InvoiceLine PaymentPurposeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:FreeOfChargeIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-519">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cbc:FreeOfChargeIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-519]-A UBL invoice should not include the InvoiceLine FreeOfChargeIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:StartTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-520">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:StartTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-520]-A UBL invoice should not include the InvoiceLine InvoicePeriod StartTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:EndTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-521">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:EndTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-521]-A UBL invoice should not include the InvoiceLine InvoicePeriod EndTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DurationMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-522">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DurationMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-522]-A UBL invoice should not include the InvoiceLine InvoicePeriod DurationMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DescriptionCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-523">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:DescriptionCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-523]-A UBL invoice should not include the InvoiceLine InvoicePeriod DescriptionCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:Description))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-524">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:InvoicePeriod/cbc:Description)</xsl:attribute>
                     <svrl:text>[UBL-CR-524]-A UBL invoice should not include the InvoiceLine InvoicePeriod Description</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:SalesOrderLineID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-525">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:SalesOrderLineID)</xsl:attribute>
                     <svrl:text>[UBL-CR-525]-A UBL invoice should not include the InvoiceLine OrderLineReference SalesOrderLineID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-526">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-526]-A UBL invoice should not include the InvoiceLine OrderLineReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:LineStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-527">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cbc:LineStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-527]-A UBL invoice should not include the InvoiceLine OrderLineReference LineStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cac:OrderReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-528">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OrderLineReference/cac:OrderReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-528]-A UBL invoice should not include the InvoiceLine OrderLineReference OrderReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DespatchLineReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-529">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DespatchLineReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-529]-A UBL invoice should not include the InvoiceLine DespatchLineReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ReceiptLineReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-530">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ReceiptLineReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-530]-A UBL invoice should not include the InvoiceLine ReceiptLineReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:BillingReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-531">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:BillingReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-531]-A UBL invoice should not include the InvoiceLine BillingReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:CopyIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-532">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:CopyIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-532]-A UBL invoice should not include the InvoiceLine DocumentReference CopyIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:UUID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-533">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:UUID)</xsl:attribute>
                     <svrl:text>[UBL-CR-533]-A UBL invoice should not include the InvoiceLine DocumentReference UUID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueDate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-534">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueDate)</xsl:attribute>
                     <svrl:text>[UBL-CR-534]-A UBL invoice should not include the InvoiceLine DocumentReference IssueDate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueTime))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-535">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:IssueTime)</xsl:attribute>
                     <svrl:text>[UBL-CR-535]-A UBL invoice should not include the InvoiceLine DocumentReference IssueTime</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-537">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentType)</xsl:attribute>
                     <svrl:text>[UBL-CR-537]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:Xpath))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-538">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:Xpath)</xsl:attribute>
                     <svrl:text>[UBL-CR-538]-A UBL invoice should not include the InvoiceLine DocumentReference Xpath</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LanguageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-539">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LanguageID)</xsl:attribute>
                     <svrl:text>[UBL-CR-539]-A UBL invoice should not include the InvoiceLine DocumentReference LanguageID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LocaleCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-540">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:LocaleCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-540]-A UBL invoice should not include the InvoiceLine DocumentReference LocaleCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:VersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-541">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:VersionID)</xsl:attribute>
                     <svrl:text>[UBL-CR-541]-A UBL invoice should not include the InvoiceLine DocumentReference VersionID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentStatusCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-542">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentStatusCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-542]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentStatusCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-543">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-543]-A UBL invoice should not include the InvoiceLine DocumentReference DocumentDescription</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-544">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-544]-A UBL invoice should not include the InvoiceLine DocumentReference Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-545">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-545]-A UBL invoice should not include the InvoiceLine DocumentReference ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-546">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-546]-A UBL invoice should not include the InvoiceLine DocumentReference IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ResultOfVerification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-547">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DocumentReference/cac:ResultOfVerification)</xsl:attribute>
                     <svrl:text>[UBL-CR-547]-A UBL invoice should not include the InvoiceLine DocumentReference ResultOfVerification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PricingReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-548">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PricingReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-548]-A UBL invoice should not include the InvoiceLine PricingReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OriginatorParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-549">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:OriginatorParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-549]-A UBL invoice should not include the InvoiceLine OriginatorParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Delivery))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-550">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Delivery)</xsl:attribute>
                     <svrl:text>[UBL-CR-550]-A UBL invoice should not include the InvoiceLine Delivery</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PaymentTerms))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-551">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:PaymentTerms)</xsl:attribute>
                     <svrl:text>[UBL-CR-551]-A UBL invoice should not include the InvoiceLine PaymentTerms</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-552">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-552]-A UBL invoice should not include the InvoiceLine AllowanceCharge ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PrepaidIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-553">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PrepaidIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-553]-A UBL invoice should not include the InvoiceLine AllowanceCharge PrepaidIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:SequenceNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-554">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:SequenceNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-554]-A UBL invoice should not include the InvoiceLine AllowanceCharge SequenceNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCostCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-555">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCostCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-555]-A UBL invoice should not include the InvoiceLine AllowanceCharge AccountingCostCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCost))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-556">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:AccountingCost)</xsl:attribute>
                     <svrl:text>[UBL-CR-556]-A UBL invoice should not include the InvoiceLine AllowanceCharge AccountingCost</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-557">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-557]-A UBL invoice should not include the InvoiceLine AllowanceCharge PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxCategory))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-558">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxCategory)</xsl:attribute>
                     <svrl:text>[UBL-CR-558]-A UBL invoice should not include the InvoiceLine AllowanceCharge TaxCategory</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-559">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:TaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-559]-A UBL invoice should not include the InvoiceLine AllowanceCharge TaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:PaymentMeans))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-560">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:AllowanceCharge/cac:PaymentMeans)</xsl:attribute>
                     <svrl:text>[UBL-CR-560]-A UBL invoice should not include the InvoiceLine AllowanceCharge PaymentMeans</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:TaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-561">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:TaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-561]-A UBL invoice should not include the InvoiceLine TaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:WithholdingTaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-562">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:WithholdingTaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-562]-A UBL invoice should not include the InvoiceLine WithholdingTaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackQuantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-563">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackQuantity)</xsl:attribute>
                     <svrl:text>[UBL-CR-563]-A UBL invoice should not include the InvoiceLine Item PackQuantity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackSizeNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-564">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:PackSizeNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-564]-A UBL invoice should not include the InvoiceLine Item PackSizeNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:CatalogueIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-565">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:CatalogueIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-565]-A UBL invoice should not include the InvoiceLine Item CatalogueIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:HazardousRiskIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-566">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:HazardousRiskIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-566]-A UBL invoice should not include the InvoiceLine Item HazardousRiskIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:AdditionalInformation))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-567">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:AdditionalInformation)</xsl:attribute>
                     <svrl:text>[UBL-CR-567]-A UBL invoice should not include the InvoiceLine Item AdditionalInformation</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:Keyword))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-568">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:Keyword)</xsl:attribute>
                     <svrl:text>[UBL-CR-568]-A UBL invoice should not include the InvoiceLine Item Keyword</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:BrandName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-569">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:BrandName)</xsl:attribute>
                     <svrl:text>[UBL-CR-569]-A UBL invoice should not include the InvoiceLine Item BrandName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:ModelName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-570">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cbc:ModelName)</xsl:attribute>
                     <svrl:text>[UBL-CR-570]-A UBL invoice should not include the InvoiceLine Item ModelName</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-571">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:ExtendedID)</xsl:attribute>
                     <svrl:text>[UBL-CR-571]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification ExtendedID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:BareCodeSymbologyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-572">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cbc:BareCodeSymbologyID)</xsl:attribute>
                     <svrl:text>[UBL-CR-572]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification BareCodeSymbologyID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:PhysicalAttribute))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-573">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:PhysicalAttribute)</xsl:attribute>
                     <svrl:text>[UBL-CR-573]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification PhysicalAttribute</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:MeasurementDimension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-574">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:MeasurementDimension)</xsl:attribute>
                     <svrl:text>[UBL-CR-574]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification MeasurementDimension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-575">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:BuyersItemIdentification/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-575]-A UBL invoice should not include the InvoiceLine Item BuyersItemIdentification IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-576">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID)</xsl:attribute>
                     <svrl:text>[UBL-CR-576]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification ExtendedID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:BareCodeSymbologyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-577">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cbc:BareCodeSymbologyID)</xsl:attribute>
                     <svrl:text>[UBL-CR-577]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification BareCodeSymbologyID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-578">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute)</xsl:attribute>
                     <svrl:text>[UBL-CR-578]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification PhysicalAttribute</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-579">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension)</xsl:attribute>
                     <svrl:text>[UBL-CR-579]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification MeasurementDimension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-580">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:SellersItemIdentification/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-580]-A UBL invoice should not include the InvoiceLine Item SellersItemIdentification IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturersItemIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-581">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturersItemIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-581]-A UBL invoice should not include the InvoiceLine Item ManufacturersItemIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-582">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID)</xsl:attribute>
                     <svrl:text>[UBL-CR-582]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification ExtendedID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:BareCodeSymbologyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-583">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cbc:BareCodeSymbologyID)</xsl:attribute>
                     <svrl:text>[UBL-CR-583]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification BareCodeSymbologyID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-584">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute)</xsl:attribute>
                     <svrl:text>[UBL-CR-584]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification PhysicalAttribute</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-585">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension)</xsl:attribute>
                     <svrl:text>[UBL-CR-585]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification MeasurementDimension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:IssuerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-586">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:StandardItemIdentification/cac:IssuerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-586]-A UBL invoice should not include the InvoiceLine Item StandardItemIdentification IssuerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueItemIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-587">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueItemIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-587]-A UBL invoice should not include the InvoiceLine Item CatalogueItemIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemIdentification))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-588">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemIdentification)</xsl:attribute>
                     <svrl:text>[UBL-CR-588]-A UBL invoice should not include the InvoiceLine Item AdditionalItemIdentification</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-589">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CatalogueDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-589]-A UBL invoice should not include the InvoiceLine Item CatalogueDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemSpecificationDocumentReference))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-590">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemSpecificationDocumentReference)</xsl:attribute>
                     <svrl:text>[UBL-CR-590]-A UBL invoice should not include the InvoiceLine Item ItemSpecificationDocumentReference</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginCountry/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-591">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginCountry/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-591]-A UBL invoice should not include the InvoiceLine Item OriginCountry Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:NatureCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-592">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:NatureCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-592]-A UBL invoice should not include the InvoiceLine Item CommodityClassification NatureCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-593">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-593]-A UBL invoice should not include the InvoiceLine Item CommodityClassification CargoTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CommodityCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-594">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:CommodityClassification/cbc:CommodityCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-594]-A UBL invoice should not include the InvoiceLine Item CommodityClassification CommodityCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:TransactionConditions))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-595">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:TransactionConditions)</xsl:attribute>
                     <svrl:text>[UBL-CR-595]-A UBL invoice should not include the InvoiceLine Item TransactionConditions</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:HazardousItem))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-596">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:HazardousItem)</xsl:attribute>
                     <svrl:text>[UBL-CR-596]-A UBL invoice should not include the InvoiceLine Item HazardousItem</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-597">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-597]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-598">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure)</xsl:attribute>
                     <svrl:text>[UBL-CR-598]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory BaseUnitMeasure</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-599">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-599]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-600">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-600]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxExemptionReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-601">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-601]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxExemptionReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-602">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange)</xsl:attribute>
                     <svrl:text>[UBL-CR-602]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRange</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-603">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent)</xsl:attribute>
                     <svrl:text>[UBL-CR-603]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TierRatePercent</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-604">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name)</xsl:attribute>
                     <svrl:text>[UBL-CR-604]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme Name</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-605">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-605]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme TaxTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-606">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-606]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme CurrencyCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-607">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdiccionRegionAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-607]-A UBL invoice should not include the InvoiceLine Item ClassifiedTaxCategory TaxScheme JurisdiccionRegionAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-608">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-608]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:NameCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-609">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:NameCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-609]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty NameCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-610">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod)</xsl:attribute>
                     <svrl:text>[UBL-CR-610]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty TestMethod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-611">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity)</xsl:attribute>
                     <svrl:text>[UBL-CR-611]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQuantity</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-612">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier)</xsl:attribute>
                     <svrl:text>[UBL-CR-612]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ValueQualifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-613">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-613]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ImportanceCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ListValue))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-614">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cbc:ListValue)</xsl:attribute>
                     <svrl:text>[UBL-CR-614]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ListValue</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-615">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-615]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty UsabilityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-616">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup)</xsl:attribute>
                     <svrl:text>[UBL-CR-616]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyGroup</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-617">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension)</xsl:attribute>
                     <svrl:text>[UBL-CR-617]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty RangeDimension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-618">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange)</xsl:attribute>
                     <svrl:text>[UBL-CR-618]-A UBL invoice should not include the InvoiceLine Item AdditionalItemProperty ItemPropertyRange</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturerParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-619">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ManufacturerParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-619]-A UBL invoice should not include the InvoiceLine Item ManufacturerParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:InformationContentProviderParty))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-620">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:InformationContentProviderParty)</xsl:attribute>
                     <svrl:text>[UBL-CR-620]-A UBL invoice should not include the InvoiceLine Item InformationContentProviderParty</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginAddress))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-621">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:OriginAddress)</xsl:attribute>
                     <svrl:text>[UBL-CR-621]-A UBL invoice should not include the InvoiceLine Item OriginAddress</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemInstance))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-622">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:ItemInstance)</xsl:attribute>
                     <svrl:text>[UBL-CR-622]-A UBL invoice should not include the InvoiceLine Item ItemInstance</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Certificate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-623">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Certificate)</xsl:attribute>
                     <svrl:text>[UBL-CR-623]-A UBL invoice should not include the InvoiceLine Item Certificate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Dimension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-624">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Dimension)</xsl:attribute>
                     <svrl:text>[UBL-CR-624]-A UBL invoice should not include the InvoiceLine Item Dimension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceChangeReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-625">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceChangeReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-625]-A UBL invoice should not include the InvoiceLine Item Price PriceChangeReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceTypeCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-626">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceTypeCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-626]-A UBL invoice should not include the InvoiceLine Item Price PriceTypeCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceType))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-627">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceType)</xsl:attribute>
                     <svrl:text>[UBL-CR-627]-A UBL invoice should not include the InvoiceLine Item Price PriceType</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-628">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-628]-A UBL invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:ValidityPeriod))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-629">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:ValidityPeriod)</xsl:attribute>
                     <svrl:text>[UBL-CR-629]-A UBL invoice should not include the InvoiceLine Item Price ValidityPeriod</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceList))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-630">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:PriceList)</xsl:attribute>
                     <svrl:text>[UBL-CR-630]-A UBL invoice should not include the InvoiceLine Item Price PriceList</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-631">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cbc:OrderableUnitFactorRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-631]-A UBL invoice should not include the InvoiceLine Item Price OrderableUnitFactorRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-632">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-CR-632]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge ID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-633">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-633]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReasonCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-634">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-634]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AllowanceChargeReason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-635">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-635]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge MultiplierFactorNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-636">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PrepaidIndicator)</xsl:attribute>
                     <svrl:text>[UBL-CR-636]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PrepaidIndicator</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-637">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:SequenceNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-637]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge SequenceNumeric</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-638">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCostCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-638]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCostCode</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCost))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-639">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:AccountingCost)</xsl:attribute>
                     <svrl:text>[UBL-CR-639]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge AccountingCost</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-640">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cbc:PerUnitAmount)</xsl:attribute>
                     <svrl:text>[UBL-CR-640]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PerUnitAmount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxCategory))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-641">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxCategory)</xsl:attribute>
                     <svrl:text>[UBL-CR-641]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge TaxCategory</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxTotal))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-642">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:TaxTotal)</xsl:attribute>
                     <svrl:text>[UBL-CR-642]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge TaxTotal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:PaymentMeans))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-643">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:AllowanceCharge/cac:PaymentMeans)</xsl:attribute>
                     <svrl:text>[UBL-CR-643]-A UBL invoice should not include the InvoiceLine Item Price AllowanceCharge PaymentMeans</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:PricingExchangeRate))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-644">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:Item/cac:Price/cac:PricingExchangeRate)</xsl:attribute>
                     <svrl:text>[UBL-CR-644]-A UBL invoice should not include the InvoiceLine Item Price PricingExchangeRate</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DeliveryTerms))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-645">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:DeliveryTerms)</xsl:attribute>
                     <svrl:text>[UBL-CR-645]-A UBL invoice should not include the InvoiceLine DeliveryTerms</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:SubInvoiceLine))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-646">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:SubInvoiceLine)</xsl:attribute>
                     <svrl:text>[UBL-CR-646]-A UBL invoice should not include the InvoiceLine SubInvoiceLine</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ItemPriceExtension))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-647">
                     <xsl:attribute name="test">not((cac:InvoiceLine|cac:CreditNoteLine)/cac:ItemPriceExtension)</xsl:attribute>
                     <svrl:text>[UBL-CR-647]-A UBL invoice should not include the InvoiceLine ItemPriceExtension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:CustomizationID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-648">
                     <xsl:attribute name="test">not(cbc:CustomizationID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-648]-A UBL invoice should not include the CustomizationID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:ProfileID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-649">
                     <xsl:attribute name="test">not(cbc:ProfileID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-649]-A UBL invoice should not include the ProfileID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-650">
                     <xsl:attribute name="test">not(cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-650]-A UBL invoice shall not include the Invoice ID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:SalesOrderID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-651">
                     <xsl:attribute name="test">not(cbc:SalesOrderID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-651]-A UBL invoice should not include the SalesOrderID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:PartyTaxScheme/cbc:CompanyID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-652">
                     <xsl:attribute name="test">not(//cac:PartyTaxScheme/cbc:CompanyID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-652]-A UBL invoice should not include the PartyTaxScheme CompanyID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:PaymentID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-653">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:PaymentID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-653]-A UBL invoice should not include the PaymentID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-654">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-654]-A UBL invoice should not include the PayeeFinancialAccount scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-655">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-655]-A UBL invoice shall not include the FinancialInstitutionBranch ID scheme identifier</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:InvoiceTypeCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-656">
                     <xsl:attribute name="test">not(cbc:InvoiceTypeCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-656]-A UBL invoice should not include the InvoiceTypeCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:DocumentCurrencyCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-657">
                     <xsl:attribute name="test">not(cbc:DocumentCurrencyCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-657]-A UBL invoice should not include the DocumentCurrencyCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:TaxCurrencyCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-658">
                     <xsl:attribute name="test">not(cbc:TaxCurrencyCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-658]-A UBL invoice should not include the TaxCurrencyCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-659">
                     <xsl:attribute name="test">not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-659]-A UBL invoice shall not include the AdditionalDocumentReference DocumentTypeCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:Country/cbc:IdentificationCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-660">
                     <xsl:attribute name="test">not(//cac:Country/cbc:IdentificationCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-660]-A UBL invoice should not include the Country Identification code listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cac:PaymentMeans/cbc:PaymentMeansCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-661">
                     <xsl:attribute name="test">not(cac:PaymentMeans/cbc:PaymentMeansCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-661]-A UBL invoice should not include the PaymentMeansCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cbc:AllowanceChargeReasonCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-662">
                     <xsl:attribute name="test">not(//cbc:AllowanceChargeReasonCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-662]-A UBL invoice should not include the AllowanceChargeReasonCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@unitCodeListID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-663">
                     <xsl:attribute name="test">not(//@unitCodeListID)</xsl:attribute>
                     <svrl:text>[UBL-CR-663]-A UBL invoice should not include the unitCodeListID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:FinancialInstitution))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-664">
                     <xsl:attribute name="test">not(//cac:FinancialInstitution)</xsl:attribute>
                     <svrl:text>[UBL-CR-664]-A UBL invoice should not include the FinancialInstitutionBranch FinancialInstitution</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  != '130' or not(cbc:DocumentTypeCode)]/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-665">
                     <xsl:attribute name="test">not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  != '130' or not(cbc:DocumentTypeCode)]/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-665]-A UBL invoice should not include the AdditionalDocumentReference ID schemeID unless the ID equals '130'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  = '130']/cac:Attachment))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-CR-666">
                     <xsl:attribute name="test">not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  = '130']/cac:Attachment)</xsl:attribute>
                     <svrl:text>[UBL-CR-666]-A UBL invoice shall not include an AdditionalDocumentReference simultaneously referring an Invoice Object Identifier and an Attachment</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:BuyersItemIdentification/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-667">
                     <xsl:attribute name="test">not(//cac:BuyersItemIdentification/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-667]-A UBL invoice should not include a Buyer Item Identification schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:SellersItemIdentification/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-668">
                     <xsl:attribute name="test">not(//cac:SellersItemIdentification/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-668]-A UBL invoice should not include a Sellers Item Identification schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-669">
                     <xsl:attribute name="test">not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode)</xsl:attribute>
                     <svrl:text>[UBL-CR-669]-A UBL invoice should not include a Price Allowance Reason Code</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-670">
                     <xsl:attribute name="test">not(//cac:Price/cac:AllowanceCharge/cbc:AllowanceChargeReason)</xsl:attribute>
                     <svrl:text>[UBL-CR-670]-A UBL invoice should not include a Price Allowance Reason</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-671">
                     <xsl:attribute name="test">not(//cac:Price/cac:AllowanceCharge/cbc:MultiplierFactorNumeric)</xsl:attribute>
                     <svrl:text>[UBL-CR-671]-A UBL invoice should not include a Price Allowance Multiplier Factor</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(cbc:CreditNoteTypeCode/@listID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-672">
                     <xsl:attribute name="test">not(cbc:CreditNoteTypeCode/@listID)</xsl:attribute>
                     <svrl:text>[UBL-CR-672]-A UBL credit note should not include the CreditNoteTypeCode listID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  = '130']/cbc:DocumentDescription))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-CR-673">
                     <xsl:attribute name="test">not(//cac:AdditionalDocumentReference[cbc:DocumentTypeCode  = '130']/cbc:DocumentDescription)</xsl:attribute>
                     <svrl:text>[UBL-CR-673]-A UBL invoice shall not include an AdditionalDocumentReference simultaneously referring an Invoice Object Identifier and an Document Description</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cbc:PrimaryAccountNumber/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-674">
                     <xsl:attribute name="test">not(//cbc:PrimaryAccountNumber/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-674]-A UBL invoice should not include the PrimaryAccountNumber schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:CardAccount/cbc:NetworkID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-675">
                     <xsl:attribute name="test">not(//cac:CardAccount/cbc:NetworkID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-675]-A UBL invoice should not include the NetworkID schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:PaymentMandate/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-676">
                     <xsl:attribute name="test">not(//cac:PaymentMandate/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-676]-A UBL invoice should not include the PaymentMandate/ID schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-677">
                     <xsl:attribute name="test">not(//cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-677]-A UBL invoice should not include the PayerFinancialAccount/ID schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:TaxCategory/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-678">
                     <xsl:attribute name="test">not(//cac:TaxCategory/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-678]-A UBL invoice should not include the TaxCategory/ID schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:ClassifiedTaxCategory/cbc:ID/@schemeID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-679">
                     <xsl:attribute name="test">not(//cac:ClassifiedTaxCategory/cbc:ID/@schemeID)</xsl:attribute>
                     <svrl:text>[UBL-CR-679]-A UBL invoice should not include the ClassifiedTaxCategory/ID schemeID</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//cac:PaymentMeans/cac:PayerFinancialAccount))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-CR-680">
                     <xsl:attribute name="test">not(//cac:PaymentMeans/cac:PayerFinancialAccount)</xsl:attribute>
                     <svrl:text>[UBL-CR-680]-A UBL invoice should not include the PaymentMeans/PayerFinancialAccount</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@schemeName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-08">
                     <xsl:attribute name="test">not(//@schemeName)</xsl:attribute>
                     <svrl:text>[UBL-DT-08]-Scheme name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@schemeAgencyName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-09">
                     <xsl:attribute name="test">not(//@schemeAgencyName)</xsl:attribute>
                     <svrl:text>[UBL-DT-09]-Scheme agency name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@schemeDataURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-10">
                     <xsl:attribute name="test">not(//@schemeDataURI)</xsl:attribute>
                     <svrl:text>[UBL-DT-10]-Scheme data uri attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@schemeURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-11">
                     <xsl:attribute name="test">not(//@schemeURI)</xsl:attribute>
                     <svrl:text>[UBL-DT-11]-Scheme uri attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@format))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-12">
                     <xsl:attribute name="test">not(//@format)</xsl:attribute>
                     <svrl:text>[UBL-DT-12]-Format attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@unitCodeListIdentifier))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-13">
                     <xsl:attribute name="test">not(//@unitCodeListIdentifier)</xsl:attribute>
                     <svrl:text>[UBL-DT-13]-Unit code list identifier attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@unitCodeListAgencyIdentifier))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-14">
                     <xsl:attribute name="test">not(//@unitCodeListAgencyIdentifier)</xsl:attribute>
                     <svrl:text>[UBL-DT-14]-Unit code list agency identifier attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@unitCodeListAgencyName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-15">
                     <xsl:attribute name="test">not(//@unitCodeListAgencyName)</xsl:attribute>
                     <svrl:text>[UBL-DT-15]-Unit code list agency name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@listAgencyName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-16">
                     <xsl:attribute name="test">not(//@listAgencyName)</xsl:attribute>
                     <svrl:text>[UBL-DT-16]-List agency name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@listName))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-17">
                     <xsl:attribute name="test">not(//@listName)</xsl:attribute>
                     <svrl:text>[UBL-DT-17]-List name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(//@name) - count(//cbc:PaymentMeansCode/@name) &lt;= 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-18">
                     <xsl:attribute name="test">count(//@name) - count(//cbc:PaymentMeansCode/@name) &lt;= 0</xsl:attribute>
                     <svrl:text>[UBL-DT-18]-Name attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@languageID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-19">
                     <xsl:attribute name="test">not(//@languageID)</xsl:attribute>
                     <svrl:text>[UBL-DT-19]-Language identifier attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@listURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-20">
                     <xsl:attribute name="test">not(//@listURI)</xsl:attribute>
                     <svrl:text>[UBL-DT-20]-List uri attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@listSchemeURI))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-21">
                     <xsl:attribute name="test">not(//@listSchemeURI)</xsl:attribute>
                     <svrl:text>[UBL-DT-21]-List scheme uri attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@languageLocaleID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-22">
                     <xsl:attribute name="test">not(//@languageLocaleID)</xsl:attribute>
                     <svrl:text>[UBL-DT-22]-Language local identifier attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@uri))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-23">
                     <xsl:attribute name="test">not(//@uri)</xsl:attribute>
                     <svrl:text>[UBL-DT-23]-Uri attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@currencyCodeListVersionID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-24">
                     <xsl:attribute name="test">not(//@currencyCodeListVersionID)</xsl:attribute>
                     <svrl:text>[UBL-DT-24]-Currency code list version id should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@characterSetCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-25">
                     <xsl:attribute name="test">not(//@characterSetCode)</xsl:attribute>
                     <svrl:text>[UBL-DT-25]-CharacterSetCode attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@encodingCode))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-26">
                     <xsl:attribute name="test">not(//@encodingCode)</xsl:attribute>
                     <svrl:text>[UBL-DT-26]-EncodingCode attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@schemeAgencyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-27">
                     <xsl:attribute name="test">not(//@schemeAgencyID)</xsl:attribute>
                     <svrl:text>[UBL-DT-27]-Scheme Agency ID attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(//@listAgencyID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-DT-28">
                     <xsl:attribute name="test">not(//@listAgencyID)</xsl:attribute>
                     <svrl:text>[UBL-DT-28]-List Agency ID attribute should not be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:ContractDocumentReference/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-01">
                     <xsl:attribute name="test">(count(cac:ContractDocumentReference/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-01]-Contract identifier shall occur maximum once.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-02">
                     <xsl:attribute name="test">(count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-02]-Receive advice identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:DespatchDocumentReference/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-03">
                     <xsl:attribute name="test">(count(cac:DespatchDocumentReference/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-03]-Despatch advice identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AdditionalDocumentReference[cbc:DocumentTypeCode='130']/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-04">
                     <xsl:attribute name="test">(count(cac:AdditionalDocumentReference[cbc:DocumentTypeCode='130']/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-04]-Invoice object identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PaymentTerms/cbc:Note) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-05">
                     <xsl:attribute name="test">(count(cac:PaymentTerms/cbc:Note) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-05]-Payment terms shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:InvoiceDocumentReference) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-06">
                     <xsl:attribute name="test">(count(cac:InvoiceDocumentReference) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-06]-Preceding invoice reference shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:InvoicePeriod) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-08">
                     <xsl:attribute name="test">(count(cac:InvoicePeriod) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-08]-Invoice period shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-09">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-09]-Seller name shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-10">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-10]-Seller trader name shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-11">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-11]-Seller legal registration identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='GST']/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-12-AUNZ">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='GST']/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-12-AUNZ]-Seller Tax identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)!='GST']/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-13-AUNZ">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)!='GST']/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-13-AUNZ]-Seller tax registration shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-14">
                     <xsl:attribute name="test">(count(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-14]-Seller additional legal information shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-15">
                     <xsl:attribute name="test">(count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-15]-Buyer name shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-16">
                     <xsl:attribute name="test">(count(cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-16]-Buyer identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-17">
                     <xsl:attribute name="test">(count(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-17]-Buyer legal registration identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='GST']/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-18-AUNZ">
                     <xsl:attribute name="test">(count(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme[cac:TaxScheme/upper-case(cbc:ID)='GST']/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-18-AUNZ]-Buyer Tax identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:Delivery) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-24">
                     <xsl:attribute name="test">(count(cac:Delivery) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-24]-Deliver to information shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:ProjectReference/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-39">
                     <xsl:attribute name="test">(count(cac:ProjectReference/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-39]-Project reference shall occur maximum once.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-40">
                     <xsl:attribute name="test">(count(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-40]-Buyer trade name shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(//cbc:PaymentID[not(preceding::cbc:PaymentID/. = .)]) &lt;= 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-SR-44">
                     <xsl:attribute name="test">count(//cbc:PaymentID[not(preceding::cbc:PaymentID/. = .)]) &lt;= 1</xsl:attribute>
                     <svrl:text>[UBL-SR-44]-Payment ID shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PaymentMeans/cbc:PaymentDueDate) &lt;=1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-SR-45">
                     <xsl:attribute name="test">(count(cac:PaymentMeans/cbc:PaymentDueDate) &lt;=1)</xsl:attribute>
                     <svrl:text>[UBL-SR-45]-Due Date shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PaymentMeans/cbc:PaymentMeansCode/@name) &lt;=1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-SR-46">
                     <xsl:attribute name="test">(count(cac:PaymentMeans/cbc:PaymentMeansCode/@name) &lt;=1)</xsl:attribute>
                     <svrl:text>[UBL-SR-46]-Payment means text shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(//cbc:PaymentMeansCode[not(preceding::cbc:PaymentMeansCode/. = .)]) &lt;= 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="warning"
                                      id="UBL-SR-47">
                     <xsl:attribute name="test">count(//cbc:PaymentMeansCode[not(preceding::cbc:PaymentMeansCode/. = .)]) &lt;= 1</xsl:attribute>
                     <svrl:text>[UBL-SR-47]-When there are more than one payment means code, they shall be equal</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:InvoicePeriod/cbc:DescriptionCode) &lt;=1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-49">
                     <xsl:attribute name="test">(count(cac:InvoicePeriod/cbc:DescriptionCode) &lt;=1)</xsl:attribute>
                     <svrl:text>[UBL-SR-49]-Value tax point date shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoiceLine | cac:CreditNoteLine"
                 priority="26"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine | cac:CreditNoteLine" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine | cac:CreditNoteLine</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine | cac:CreditNoteLine</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cbc:Note) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-34">
                     <xsl:attribute name="test">(count(cbc:Note) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-34]-Invoice line note shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:OrderLineReference/cbc:LineID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-35">
                     <xsl:attribute name="test">(count(cac:OrderLineReference/cbc:LineID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-35]-Referenced purchase order line identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:InvoicePeriod) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-36">
                     <xsl:attribute name="test">(count(cac:InvoicePeriod) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-36]-Invoice line period shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:Price/cac:AllowanceCharge/cbc:Amount) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-37">
                     <xsl:attribute name="test">(count(cac:Price/cac:AllowanceCharge/cbc:Amount) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-37]-Item price discount shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Item/cac:ClassifiedTaxCategory) = 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-48">
                     <xsl:attribute name="test">count(cac:Item/cac:ClassifiedTaxCategory) = 1</xsl:attribute>
                     <svrl:text>[UBL-SR-48]-Invoice lines shall have one and only one classified tax category.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Item/cbc:Description) &lt;= 1)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-50">
                     <xsl:attribute name="test">count(cac:Item/cbc:Description) &lt;= 1</xsl:attribute>
                     <svrl:text>[UBL-SR-50]-Item description shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PayeeParty" priority="25" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PayeeParty" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PayeeParty</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PayeeParty</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cac:PartyName/cbc:Name) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-19">
                     <xsl:attribute name="test">(count(cac:PartyName/cbc:Name) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))</xsl:attribute>
                     <svrl:text>[UBL-SR-19]-Payee name shall occur maximum once, if the Payee is different from the Seller</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PartyIdentification/cbc:ID[upper-case(@schemeID) != 'SEPA']) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-20">
                     <xsl:attribute name="test">(count(cac:PartyIdentification/cbc:ID[upper-case(@schemeID) != 'SEPA']) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))</xsl:attribute>
                     <svrl:text>[UBL-SR-20]-Payee identifier shall occur maximum once, if the Payee is different from the Seller</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-21">
                     <xsl:attribute name="test">(count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1) and ((cac:PartyName/cbc:Name) != (../cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName))</xsl:attribute>
                     <svrl:text>[UBL-SR-21]-Payee legal registration identifier shall occur maximum once, if the Payee is different from the Seller</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PaymentMeans" priority="24" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentMeans" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentMeans</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cbc:PaymentID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-26">
                     <xsl:attribute name="test">(count(cbc:PaymentID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-26]-Payment reference shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:PaymentMandate/cbc:ID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-28">
                     <xsl:attribute name="test">(count(cac:PaymentMandate/cbc:ID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-28]-Mandate reference identifier shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:BillingReference" priority="23" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:BillingReference" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:BillingReference</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:BillingReference</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((cac:InvoiceDocumentReference/cbc:ID))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-07">
                     <xsl:attribute name="test">(cac:InvoiceDocumentReference/cbc:ID)</xsl:attribute>
                     <svrl:text>[UBL-SR-07]-If there is a preceding invoice reference, the preceding invoice number shall be present</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxRepresentativeParty" priority="22" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxRepresentativeParty" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxRepresentativeParty</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-22">
                     <xsl:attribute name="test">(count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-22]-Seller tax representative name shall occur maximum once, if the Seller has a tax representative</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(cac:Party/cac:PartyTaxScheme/cbc:CompanyID) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-23-AUNZ">
                     <xsl:attribute name="test">(count(cac:Party/cac:PartyTaxScheme/cbc:CompanyID) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-23-AUNZ]-Seller tax representative Tax identifier shall occur maximum once, if the Seller has a tax representative</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxSubtotal" priority="21" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e600']">
            <schxslt:rule pattern="d12e600">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxSubtotal" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxSubtotal</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e600">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxSubtotal</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((count(cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="UBL-SR-32-AUNZ">
                     <xsl:attribute name="test">(count(cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1)</xsl:attribute>
                     <svrl:text>[UBL-SR-32-AUNZ]-Tax exemption reason text shall occur maximum once</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e600')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode"
                 priority="20"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not((self::cbc:InvoiceTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 80 82 84 130 202 203 204 211 295 325 326 380 383 384 385 386 387 388 389 390 393 394 395 456 457 527 575 623 633 751 780 935 ', concat(' ', normalize-space(.), ' '))))) or (self::cbc:CreditNoteTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 81 83 261 262 296 308 381 396 420 458 532 ', concat(' ', normalize-space(.), ' '))))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-01">
                     <xsl:attribute name="test">(self::cbc:InvoiceTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 80 82 84 130 202 203 204 211 295 325 326 380 383 384 385 386 387 388 389 390 393 394 395 456 457 527 575 623 633 751 780 935 ', concat(' ', normalize-space(.), ' '))))) or (self::cbc:CreditNoteTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 81 83 261 262 296 308 381 396 420 458 532 ', concat(' ', normalize-space(.), ' ')))))</xsl:attribute>
                     <svrl:text>[BR-CL-01]-The document type code MUST be coded by the invoice and credit note related code lists of UNTDID 1001.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount"
                 priority="19"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:Amount | cbc:BaseAmount | cbc:PriceAmount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:AllowanceTotalAmount | cbc:ChargeTotalAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@currencyID), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(@currencyID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-03">
                     <xsl:attribute name="test">((not(contains(normalize-space(@currencyID), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(@currencyID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-03]-currencyID MUST be coded using ISO code list 4217 alpha-3</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:DocumentCurrencyCode" priority="18" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:DocumentCurrencyCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:DocumentCurrencyCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:DocumentCurrencyCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-04">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-04]-Invoice currency code MUST be coded using ISO code list 4217 alpha-3</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:TaxCurrencyCode" priority="17" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:TaxCurrencyCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:TaxCurrencyCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:TaxCurrencyCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-05">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DOP DZD EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USN UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XOF XPD XPF XPT XSU XTS XUA XXX YER ZAR ZMW ZWL ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-05]-Tax currency code MUST be coded using ISO code list 4217 alpha-3</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:InvoicePeriod/cbc:DescriptionCode"
                 priority="16"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoicePeriod/cbc:DescriptionCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:InvoicePeriod/cbc:DescriptionCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:InvoicePeriod/cbc:DescriptionCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' 3 35 432 ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-06-AUNZ">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' 3 35 432 ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-06-AUNZ]-Tax point date code MUST be coded using a restriction of UNTDID 2005.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID] | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]"
                 priority="15"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID] | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID] | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AdditionalDocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID] | cac:DocumentReference[cbc:DocumentTypeCode = '130']/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' AAA AAB AAC AAD AAE AAF AAG AAH AAI AAJ AAK AAL AAM AAN AAO AAP AAQ AAR AAS AAT AAU AAV AAW AAX AAY AAZ ABA ABB ABC ABD ABE ABF ABG ABH ABI ABJ ABK ABL ABM ABN ABO ABP ABQ ABR ABS ABT ABU ABV ABW ABX ABY ABZ AC ACA ACB ACC ACD ACE ACF ACG ACH ACI ACJ ACK ACL ACN ACO ACP ACQ ACR ACT ACU ACV ACW ACX ACY ACZ ADA ADB ADC ADD ADE ADF ADG ADI ADJ ADK ADL ADM ADN ADO ADP ADQ ADT ADU ADV ADW ADX ADY ADZ AE AEA AEB AEC AED AEE AEF AEG AEH AEI AEJ AEK AEL AEM AEN AEO AEP AEQ AER AES AET AEU AEV AEW AEX AEY AEZ AF AFA AFB AFC AFD AFE AFF AFG AFH AFI AFJ AFK AFL AFM AFN AFO AFP AFQ AFR AFS AFT AFU AFV AFW AFX AFY AFZ AGA AGB AGC AGD AGE AGF AGG AGH AGI AGJ AGK AGL AGM AGN AGO AGP AGQ AGR AGS AGT AGU AGV AGW AGX AGY AGZ AHA AHB AHC AHD AHE AHF AHG AHH AHI AHJ AHK AHL AHM AHN AHO AHP AHQ AHR AHS AHT AHU AHV AHX AHY AHZ AIA AIB AIC AID AIE AIF AIG AIH AII AIJ AIK AIL AIM AIN AIO AIP AIQ AIR AIS AIT AIU AIV AIW AIX AIY AIZ AJA AJB AJC AJD AJE AJF AJG AJH AJI AJJ AJK AJL AJM AJN AJO AJP AJQ AJR AJS AJT AJU AJV AJW AJX AJY AJZ AKA AKB AKC AKD AKE AKF AKG AKH AKI AKJ AKK AKL AKM AKN AKO AKP AKQ AKR AKS AKT AKU AKV AKW AKX AKY AKZ ALA ALB ALC ALD ALE ALF ALG ALH ALI ALJ ALK ALL ALM ALN ALO ALP ALQ ALR ALS ALT ALU ALV ALW ALX ALY ALZ AMA AMB AMC AMD AME AMF AMG AMH AMI AMJ AMK AML AMM AMN AMO AMP AMQ AMR AMS AMT AMU AMV AMW AMX AMY AMZ ANA ANB ANC AND ANE ANF ANG ANH ANI ANJ ANK ANL ANM ANN ANO ANP ANQ ANR ANS ANT ANU ANV ANW ANX ANY AOA AOD AOE AOF AOG AOH AOI AOJ AOK AOL AOM AON AOO AOP AOQ AOR AOS AOT AOU AOV AOW AOX AOY AOZ AP APA APB APC APD APE APF APG APH API APJ APK APL APM APN APO APP APQ APR APS APT APU APV APW APX APY APZ AQA AQB AQC AQD AQE AQF AQG AQH AQI AQJ AQK AQL AQM AQN AQO AQP AQQ AQR AQS AQT AQU AQV AQW AQX AQY AQZ ARA ARB ARC ARD ARE ARF ARG ARH ARI ARJ ARK ARL ARM ARN ARO ARP ARQ ARR ARS ART ARU ARV ARW ARX ARY ARZ ASA ASB ASC ASD ASE ASF ASG ASH ASI ASJ ASK ASL ASM ASN ASO ASP ASQ ASR ASS AST ASU ASV ASW ASX ASY ASZ ATA ATB ATC ATD ATE ATF ATG ATH ATI ATJ ATK ATL ATM ATN ATO ATP ATQ ATR ATS ATT ATU ATV ATW ATX ATY ATZ AU AUA AUB AUC AUD AUE AUF AUG AUH AUI AUJ AUK AUL AUM AUN AUO AUP AUQ AUR AUS AUT AUU AUV AUW AUX AUY AUZ AV AVA AVB AVC AVD AVE AVF AVG AVH AVI AVJ AVK AVL AVM AVN AVO AVP AVQ AVR AVS AVT AVU AVV AVW AVX AVY AVZ AWA AWB AWC AWD AWE AWF AWG AWH AWI AWJ AWK AWL AWM AWN AWO AWP AWQ AWR AWS AWT AWU AWV AWW AWX AWY AWZ AXA AXB AXC AXD AXE AXF AXG AXH AXI AXJ AXK AXL AXM AXN AXO AXP AXQ AXR AXS BA BC BD BE BH BM BN BO BR BT BTP BW CAS CAT CAU CAV CAW CAX CAY CAZ CBA CBB CD CEC CED CFE CFF CFO CG CH CK CKN CM CMR CN CNO COF CP CR CRN CS CST CT CU CV CW CZ DA DAN DB DI DL DM DQ DR EA EB ED EE EEP EI EN EQ ER ERN ET EX FC FF FI FLW FN FO FS FT FV FX GA GC GD GDN GN HS HWB IA IB ICA ICE ICO II IL INB INN INO IP IS IT IV JB JE LA LAN LAR LB LC LI LO LRC LS MA MB MF MG MH MR MRN MS MSS MWB NA NF OH OI ON OP OR PB PC PD PE PF PI PK PL POR PP PQ PR PS PW PY RA RC RCN RE REN RF RR RT SA SB SD SE SEA SF SH SI SM SN SP SQ SRN SS STA SW SZ TB TCR TE TF TI TIN TL TN TP UAR UC UCN UN UO URI VA VC VGR VM VN VON VOR VP VR VS VT VV WE WM WN WR WS WY XA XC XP ZZZ ', concat(' ', normalize-space(@schemeID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-07">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' AAA AAB AAC AAD AAE AAF AAG AAH AAI AAJ AAK AAL AAM AAN AAO AAP AAQ AAR AAS AAT AAU AAV AAW AAX AAY AAZ ABA ABB ABC ABD ABE ABF ABG ABH ABI ABJ ABK ABL ABM ABN ABO ABP ABQ ABR ABS ABT ABU ABV ABW ABX ABY ABZ AC ACA ACB ACC ACD ACE ACF ACG ACH ACI ACJ ACK ACL ACN ACO ACP ACQ ACR ACT ACU ACV ACW ACX ACY ACZ ADA ADB ADC ADD ADE ADF ADG ADI ADJ ADK ADL ADM ADN ADO ADP ADQ ADT ADU ADV ADW ADX ADY ADZ AE AEA AEB AEC AED AEE AEF AEG AEH AEI AEJ AEK AEL AEM AEN AEO AEP AEQ AER AES AET AEU AEV AEW AEX AEY AEZ AF AFA AFB AFC AFD AFE AFF AFG AFH AFI AFJ AFK AFL AFM AFN AFO AFP AFQ AFR AFS AFT AFU AFV AFW AFX AFY AFZ AGA AGB AGC AGD AGE AGF AGG AGH AGI AGJ AGK AGL AGM AGN AGO AGP AGQ AGR AGS AGT AGU AGV AGW AGX AGY AGZ AHA AHB AHC AHD AHE AHF AHG AHH AHI AHJ AHK AHL AHM AHN AHO AHP AHQ AHR AHS AHT AHU AHV AHX AHY AHZ AIA AIB AIC AID AIE AIF AIG AIH AII AIJ AIK AIL AIM AIN AIO AIP AIQ AIR AIS AIT AIU AIV AIW AIX AIY AIZ AJA AJB AJC AJD AJE AJF AJG AJH AJI AJJ AJK AJL AJM AJN AJO AJP AJQ AJR AJS AJT AJU AJV AJW AJX AJY AJZ AKA AKB AKC AKD AKE AKF AKG AKH AKI AKJ AKK AKL AKM AKN AKO AKP AKQ AKR AKS AKT AKU AKV AKW AKX AKY AKZ ALA ALB ALC ALD ALE ALF ALG ALH ALI ALJ ALK ALL ALM ALN ALO ALP ALQ ALR ALS ALT ALU ALV ALW ALX ALY ALZ AMA AMB AMC AMD AME AMF AMG AMH AMI AMJ AMK AML AMM AMN AMO AMP AMQ AMR AMS AMT AMU AMV AMW AMX AMY AMZ ANA ANB ANC AND ANE ANF ANG ANH ANI ANJ ANK ANL ANM ANN ANO ANP ANQ ANR ANS ANT ANU ANV ANW ANX ANY AOA AOD AOE AOF AOG AOH AOI AOJ AOK AOL AOM AON AOO AOP AOQ AOR AOS AOT AOU AOV AOW AOX AOY AOZ AP APA APB APC APD APE APF APG APH API APJ APK APL APM APN APO APP APQ APR APS APT APU APV APW APX APY APZ AQA AQB AQC AQD AQE AQF AQG AQH AQI AQJ AQK AQL AQM AQN AQO AQP AQQ AQR AQS AQT AQU AQV AQW AQX AQY AQZ ARA ARB ARC ARD ARE ARF ARG ARH ARI ARJ ARK ARL ARM ARN ARO ARP ARQ ARR ARS ART ARU ARV ARW ARX ARY ARZ ASA ASB ASC ASD ASE ASF ASG ASH ASI ASJ ASK ASL ASM ASN ASO ASP ASQ ASR ASS AST ASU ASV ASW ASX ASY ASZ ATA ATB ATC ATD ATE ATF ATG ATH ATI ATJ ATK ATL ATM ATN ATO ATP ATQ ATR ATS ATT ATU ATV ATW ATX ATY ATZ AU AUA AUB AUC AUD AUE AUF AUG AUH AUI AUJ AUK AUL AUM AUN AUO AUP AUQ AUR AUS AUT AUU AUV AUW AUX AUY AUZ AV AVA AVB AVC AVD AVE AVF AVG AVH AVI AVJ AVK AVL AVM AVN AVO AVP AVQ AVR AVS AVT AVU AVV AVW AVX AVY AVZ AWA AWB AWC AWD AWE AWF AWG AWH AWI AWJ AWK AWL AWM AWN AWO AWP AWQ AWR AWS AWT AWU AWV AWW AWX AWY AWZ AXA AXB AXC AXD AXE AXF AXG AXH AXI AXJ AXK AXL AXM AXN AXO AXP AXQ AXR AXS BA BC BD BE BH BM BN BO BR BT BTP BW CAS CAT CAU CAV CAW CAX CAY CAZ CBA CBB CD CEC CED CFE CFF CFO CG CH CK CKN CM CMR CN CNO COF CP CR CRN CS CST CT CU CV CW CZ DA DAN DB DI DL DM DQ DR EA EB ED EE EEP EI EN EQ ER ERN ET EX FC FF FI FLW FN FO FS FT FV FX GA GC GD GDN GN HS HWB IA IB ICA ICE ICO II IL INB INN INO IP IS IT IV JB JE LA LAN LAR LB LC LI LO LRC LS MA MB MF MG MH MR MRN MS MSS MWB NA NF OH OI ON OP OR PB PC PD PE PF PI PK PL POR PP PQ PR PS PW PY RA RC RCN RE REN RF RR RT SA SB SD SE SEA SF SH SI SM SN SP SQ SRN SS STA SW SZ TB TCR TE TF TI TIN TL TN TP UAR UC UCN UN UO URI VA VC VGR VM VN VON VOR VP VR VS VT VV WE WM WN WR WS WY XA XC XP ZZZ ', concat(' ', normalize-space(@schemeID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-07]-Object identifier identification scheme identifier MUST be coded using a restriction of UNTDID 1153.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PartyIdentification/cbc:ID[@schemeID]"
                 priority="14"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PartyIdentification/cbc:ID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PartyIdentification/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PartyIdentification/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' '))))  or ((not(contains(normalize-space(@schemeID), ' ')) and contains(' SEPA ', concat(' ', normalize-space(@schemeID), ' '))) and ((ancestor::cac:AccountingSupplierParty) or (ancestor::cac:PayeeParty))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-10">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' '))))  or ((not(contains(normalize-space(@schemeID), ' ')) and contains(' SEPA ', concat(' ', normalize-space(@schemeID), ' '))) and ((ancestor::cac:AccountingSupplierParty) or (ancestor::cac:PayeeParty)))</xsl:attribute>
                     <svrl:text>[BR-CL-10]-Any identifier identification scheme identifier MUST be coded using one of the ISO 6523 ICD list.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PartyLegalEntity/cbc:CompanyID[@schemeID]"
                 priority="13"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PartyLegalEntity/cbc:CompanyID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PartyLegalEntity/cbc:CompanyID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PartyLegalEntity/cbc:CompanyID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-11">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-11]-Any registration identifier identification scheme identifier MUST be coded using one of the ISO 6523 ICD list.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:CommodityClassification/cbc:ItemClassificationCode[@listID]"
                 priority="12"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CommodityClassification/cbc:ItemClassificationCode[@listID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:CommodityClassification/cbc:ItemClassificationCode[@listID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:CommodityClassification/cbc:ItemClassificationCode[@listID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@listID), ' ')) and contains(' AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CC CG CL CR CV DR DW EC EF EN FS GB GN GS HS IB IN IS IT IZ MA MF MN MP NB ON PD PL PO PV QS RC RN RU RY SA SG SK SN SRS SRT SRU SRV SRW SRX SRY SRZ SS SSA SSB SSC SSD SSE SSF SSG SSH SSI SSJ SSK SSL SSM SSN SSO SSP SSQ SSR SSS SST SSU SSV SSW SSX SSY SSZ ST STA STB STC STD STE STF STG STH STI STJ STK STL STM STN STO STP STQ STR STS STT STU STV STW STX STY STZ SUA SUB SUC SUD SUE SUF SUG SUH SUI SUJ SUK SUL SUM TG TSN TSO TSP TSQ TSR TSS TST TSU UA UP VN VP VS VX ZZZ ', concat(' ', normalize-space(@listID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-13">
                     <xsl:attribute name="test">((not(contains(normalize-space(@listID), ' ')) and contains(' AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CC CG CL CR CV DR DW EC EF EN FS GB GN GS HS IB IN IS IT IZ MA MF MN MP NB ON PD PL PO PV QS RC RN RU RY SA SG SK SN SRS SRT SRU SRV SRW SRX SRY SRZ SS SSA SSB SSC SSD SSE SSF SSG SSH SSI SSJ SSK SSL SSM SSN SSO SSP SSQ SSR SSS SST SSU SSV SSW SSX SSY SSZ ST STA STB STC STD STE STF STG STH STI STJ STK STL STM STN STO STP STQ STR STS STT STU STV STW STX STY STZ SUA SUB SUC SUD SUE SUF SUG SUH SUI SUJ SUK SUL SUM TG TSN TSO TSP TSQ TSR TSS TST TSU UA UP VN VP VS VX ZZZ ', concat(' ', normalize-space(@listID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-13]-Item classification identifier identification scheme identifier MUST be
      coded using one of the UNTDID 7143 list.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:Country/cbc:IdentificationCode"
                 priority="11"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:Country/cbc:IdentificationCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:Country/cbc:IdentificationCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:Country/cbc:IdentificationCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' 1A AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS XI YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-14">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' 1A AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS XI YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-14]-Country codes in an invoice MUST be coded using ISO code list 3166-1</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:OriginCountry/cbc:IdentificationCode"
                 priority="10"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:OriginCountry/cbc:IdentificationCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:OriginCountry/cbc:IdentificationCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:OriginCountry/cbc:IdentificationCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' 1A AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS XI YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-15">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' 1A AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS XI YE YT ZA ZM ZW ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-15]-Country codes in an invoice MUST be coded using ISO code list 3166-1</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:PaymentMeans/cbc:PaymentMeansCode"
                 priority="9"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentMeans/cbc:PaymentMeansCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PaymentMeans/cbc:PaymentMeansCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:PaymentMeans/cbc:PaymentMeansCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 74 75 76 77 78 91 92 93 94 95 96 97 ZZZ ',concat(' ',normalize-space(.),' ') ) ) ))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-16">
                     <xsl:attribute name="test">( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 74 75 76 77 78 91 92 93 94 95 96 97 ZZZ ',concat(' ',normalize-space(.),' ') ) ) )</xsl:attribute>
                     <svrl:text>[BR-CL-16]-Payment means in an invoice MUST be coded using UNCL4461 code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:TaxCategory/cbc:ID" priority="8" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxCategory/cbc:ID" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:TaxCategory/cbc:ID</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:TaxCategory/cbc:ID</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K B ',concat(' ',normalize-space(.),' ') ) ) ))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-17">
                     <xsl:attribute name="test">( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K B ',concat(' ',normalize-space(.),' ') ) ) )</xsl:attribute>
                     <svrl:text>[BR-CL-17]-Invoice tax categories MUST be coded using UNCL5305 code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:ClassifiedTaxCategory/cbc:ID" priority="7" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:ClassifiedTaxCategory/cbc:ID" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:ClassifiedTaxCategory/cbc:ID</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:ClassifiedTaxCategory/cbc:ID</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K B ',concat(' ',normalize-space(.),' ') ) ) ))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-18">
                     <xsl:attribute name="test">( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K B ',concat(' ',normalize-space(.),' ') ) ) )</xsl:attribute>
                     <svrl:text>[BR-CL-18]-Invoice tax categories MUST be coded using UNCL5305 code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode"
                 priority="6"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = false()]/cbc:AllowanceChargeReasonCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' 41 42 60 62 63 64 65 66 67 68 70 71 88 95 100 102 103 104 ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-19">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' 41 42 60 62 63 64 65 66 67 68 70 71 88 95 100 102 103 104 ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-19]-Coded allowance reasons MUST belong to the UNCL 5189 code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode"
                 priority="5"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(.), ' ')) and contains(' AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CAX CAY CAZ CD CG CS CT DAB DAD DAC DAF DAG DAH DAI DAJ DAK DAL DAM DAN DAO DAP DAQ DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ ', concat(' ', normalize-space(.), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-20">
                     <xsl:attribute name="test">((not(contains(normalize-space(.), ' ')) and contains(' AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CAX CAY CAZ CD CG CS CT DAB DAD DAC DAF DAG DAH DAI DAJ DAK DAL DAM DAN DAO DAP DAQ DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ ', concat(' ', normalize-space(.), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-20]-Coded charge reasons MUST belong to the UNCL 7161 code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:StandardItemIdentification/cbc:ID[@schemeID]"
                 priority="4"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:StandardItemIdentification/cbc:ID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:StandardItemIdentification/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:StandardItemIdentification/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-21">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-21]-Item standard identifier scheme identifier MUST belong to the ISO 6523 ICD code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode] | cbc:CreditedQuantity[@unitCode]"
                 priority="3"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode] | cbc:CreditedQuantity[@unitCode]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode] | cbc:CreditedQuantity[@unitCode]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode] | cbc:CreditedQuantity[@unitCode]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@unitCode), ' ')) and contains(' 10 11 13 14 15 20 21 22 23 24 25 27 28 33 34 35 37 38 40 41 56 57 58 59 60 61 74 77 80 81 85 87 89 91 1I 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2X 2Y 2Z 3B 3C 4C 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5E 5J A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A53 A54 A55 A56 A59 A6 A68 A69 A7 A70 A71 A73 A74 A75 A76 A8 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AK AL AMH AMP ANN APZ AQ AS ASM ASU ATM AWG AY AZ B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B4 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B52 B53 B54 B55 B56 B57 B58 B59 B60 B61 B62 B63 B64 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BFT BHP BIL BLD BLL BP BPM BQL BTU BUA BUI C0 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C99 CCT CDL CEL CEN CG CGM CKG CLF CLT CMK CMQ CMT CNP CNT COU CTG CTM CTN CUR CWA CWI D03 D04 D1 D10 D11 D12 D13 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D29 D30 D31 D32 D33 D34 D36 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D65 D68 D69 D73 D74 D77 D78 D80 D81 D82 D83 D85 D86 D87 D88 D89 D91 D93 D94 D95 DAA DAD DAY DB DBM DBW DD DEC DG DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DRA DRI DRL DT DTN DWT DZN DZP E01 E07 E08 E09 E10 E12 E14 E15 E16 E17 E18 E19 E20 E21 E22 E23 E25 E27 E28 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EQ F01 F02 F03 F04 F05 F06 F07 F08 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FBM FC FF FH FIT FL FNU FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GDW GE GF GFI GGR GIA GIC GII GIP GJ GL GLD GLI GLL GM GO GP GQ GRM GRN GRO GV GWH H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HAD HBA HBX HC HDW HEA HGM HH HIU HKM HLT HM HMO HMQ HMT HPA HTZ HUR HWE IA IE INH INK INQ ISD IU IUG IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J90 J91 J92 J93 J95 J96 J97 J98 J99 JE JK JM JNT JOU JPS JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KDW KEL KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KLX KMA KMH KMK KMQ KMT KNI KNM KNS KNT KO KPA KPH KPO KPP KR KSD KSH KT KTN KUR KVA KVR KVT KW KWH KWN KWO KWS KWT KWY KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LD LEF LF LH LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LY M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M38 M39 M4 M40 M41 M42 M43 M44 M45 M46 M47 M48 M49 M5 M50 M51 M52 M53 M55 M56 M57 M58 M59 M60 M61 M62 M63 M64 M65 M66 M67 M68 M69 M7 M70 M71 M72 M73 M74 M75 M76 M77 M78 M79 M80 M81 M82 M83 M84 M85 M86 M87 M88 M89 M9 M90 M91 M92 M93 M94 M95 M96 M97 M98 M99 MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MGM MHZ MIK MIL MIN MIO MIU MKD MKM MKW MLD MLT MMK MMQ MMT MND MNJ MON MPA MQD MQH MQM MQS MQW MRD MRM MRW MSK MTK MTQ MTR MTS MTZ MVA MWH N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N20 N21 N22 N23 N24 N25 N26 N27 N28 N29 N3 N30 N31 N32 N33 N34 N35 N36 N37 N38 N39 N40 N41 N42 N43 N44 N45 N46 N47 N48 N49 N50 N51 N52 N53 N54 N55 N56 N57 N58 N59 N60 N61 N62 N63 N64 N65 N66 N67 N68 N69 N70 N71 N72 N73 N74 N75 N76 N77 N78 N79 N80 N81 N82 N83 N84 N85 N86 N87 N88 N89 N90 N91 N92 N93 N94 N95 N96 N97 N98 N99 NA NAR NCL NEW NF NIL NIU NL NM3 NMI NMP NPT NT NTU NU NX OA ODE ODG ODK ODM OHM ON ONZ OPM OT OZA OZI P1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P5 P50 P51 P52 P53 P54 P55 P56 P57 P58 P59 P60 P61 P62 P63 P64 P65 P66 P67 P68 P69 P70 P71 P72 P73 P74 P75 P76 P77 P78 P79 P80 P81 P82 P83 P84 P85 P86 P87 P88 P89 P90 P91 P92 P93 P94 P95 P96 P97 P98 P99 PAL PD PFL PGL PI PLA PO PQ PR PS PTD PTI PTL PTN Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q3 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 QA QAN QB QR QTD QTI QTL QTR R1 R9 RH RM ROM RP RPM RPS RT S3 S4 SAN SCO SCR SEC SET SG SIE SM3 SMI SQ SQR SR STC STI STK STL STN STW SW SX SYR T0 T3 TAH TAN TI TIC TIP TKM TMS TNE TP TPI TPR TQD TRL TST TTS U1 U2 UB UC VA VLT VP W2 WA WB WCD WE WEB WEE WG WHR WM WSD WTT X1 YDK YDQ YRD Z11 Z9 ZP ZZ X1A X1B X1D X1F X1G X1W X2C X3A X3H X43 X44 X4A X4B X4C X4D X4F X4G X4H X5H X5L X5M X6H X6P X7A X7B X8A X8B X8C XAA XAB XAC XAD XAE XAF XAG XAH XAI XAJ XAL XAM XAP XAT XAV XB4 XBA XBB XBC XBD XBE XBF XBG XBH XBI XBJ XBK XBL XBM XBN XBO XBP XBQ XBR XBS XBT XBU XBV XBW XBX XBY XBZ XCA XCB XCC XCD XCE XCF XCG XCH XCI XCJ XCK XCL XCM XCN XCO XCP XCQ XCR XCS XCT XCU XCV XCW XCX XCY XCZ XDA XDB XDC XDG XDH XDI XDJ XDK XDL XDM XDN XDP XDR XDS XDT XDU XDV XDW XDX XDY XEC XED XEE XEF XEG XEH XEI XEN XFB XFC XFD XFE XFI XFL XFO XFP XFR XFT XFW XFX XGB XGI XGL XGR XGU XGY XGZ XHA XHB XHC XHG XHN XHR XIA XIB XIC XID XIE XIF XIG XIH XIK XIL XIN XIZ XJB XJC XJG XJR XJT XJY XKG XKI XLE XLG XLT XLU XLV XLZ XMA XMB XMC XME XMR XMS XMT XMW XMX XNA XNE XNF XNG XNS XNT XNU XNV XO1 XO2 XO3 XO4 XO5 XO6 XO7 XO8 XO9 XOA XOB XOC XOD XOE XOF XOG XOH XOI XOJ XOK XOL XOM XON XOP XOQ XOR XOS XOT XOU XOV XOW XOX XOY XOZ XP1 XP2 XP3 XP4 XPA XPB XPC XPD XPE XPF XPG XPH XPI XPJ XPK XPL XPN XPO XPP XPR XPT XPU XPV XPX XPY XPZ XQA XQB XQC XQD XQF XQG XQH XQJ XQK XQL XQM XQN XQP XQQ XQR XQS XRD XRG XRJ XRK XRL XRO XRT XRZ XSA XSB XSC XSD XSE XSH XSI XSK XSL XSM XSO XSP XSS XST XSU XSV XSW XSX XSY XSZ XT1 XTB XTC XTD XTE XTG XTI XTK XTL XTN XTO XTR XTS XTT XTU XTV XTW XTY XTZ XUC XUN XVA XVG XVI XVK XVL XVN XVO XVP XVQ XVR XVS XVY XWA XWB XWC XWD XWF XWG XWH XWJ XWK XWL XWM XWN XWP XWQ XWR XWS XWT XWU XWV XWW XWX XWY XWZ XXA XXB XXC XXD XXF XXG XXH XXJ XXK XYA XYB XYC XYD XYF XYG XYH XYJ XYK XYL XYM XYN XYP XYQ XYR XYS XYT XYV XYW XYX XYY XYZ XZA XZB XZC XZD XZF XZG XZH XZJ XZK XZL XZM XZN XZP XZQ XZR XZS XZT XZU XZV XZW XZX XZY XZZ ', concat(' ', normalize-space(@unitCode), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-23">
                     <xsl:attribute name="test">((not(contains(normalize-space(@unitCode), ' ')) and contains(' 10 11 13 14 15 20 21 22 23 24 25 27 28 33 34 35 37 38 40 41 56 57 58 59 60 61 74 77 80 81 85 87 89 91 1I 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2X 2Y 2Z 3B 3C 4C 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5E 5J A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A53 A54 A55 A56 A59 A6 A68 A69 A7 A70 A71 A73 A74 A75 A76 A8 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AK AL AMH AMP ANN APZ AQ AS ASM ASU ATM AWG AY AZ B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B4 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B52 B53 B54 B55 B56 B57 B58 B59 B60 B61 B62 B63 B64 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BFT BHP BIL BLD BLL BP BPM BQL BTU BUA BUI C0 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C99 CCT CDL CEL CEN CG CGM CKG CLF CLT CMK CMQ CMT CNP CNT COU CTG CTM CTN CUR CWA CWI D03 D04 D1 D10 D11 D12 D13 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D29 D30 D31 D32 D33 D34 D36 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D65 D68 D69 D73 D74 D77 D78 D80 D81 D82 D83 D85 D86 D87 D88 D89 D91 D93 D94 D95 DAA DAD DAY DB DBM DBW DD DEC DG DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DRA DRI DRL DT DTN DWT DZN DZP E01 E07 E08 E09 E10 E12 E14 E15 E16 E17 E18 E19 E20 E21 E22 E23 E25 E27 E28 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EQ F01 F02 F03 F04 F05 F06 F07 F08 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FBM FC FF FH FIT FL FNU FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GDW GE GF GFI GGR GIA GIC GII GIP GJ GL GLD GLI GLL GM GO GP GQ GRM GRN GRO GV GWH H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HAD HBA HBX HC HDW HEA HGM HH HIU HKM HLT HM HMO HMQ HMT HPA HTZ HUR HWE IA IE INH INK INQ ISD IU IUG IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J90 J91 J92 J93 J95 J96 J97 J98 J99 JE JK JM JNT JOU JPS JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KDW KEL KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KLX KMA KMH KMK KMQ KMT KNI KNM KNS KNT KO KPA KPH KPO KPP KR KSD KSH KT KTN KUR KVA KVR KVT KW KWH KWN KWO KWS KWT KWY KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LD LEF LF LH LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LY M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M38 M39 M4 M40 M41 M42 M43 M44 M45 M46 M47 M48 M49 M5 M50 M51 M52 M53 M55 M56 M57 M58 M59 M60 M61 M62 M63 M64 M65 M66 M67 M68 M69 M7 M70 M71 M72 M73 M74 M75 M76 M77 M78 M79 M80 M81 M82 M83 M84 M85 M86 M87 M88 M89 M9 M90 M91 M92 M93 M94 M95 M96 M97 M98 M99 MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MGM MHZ MIK MIL MIN MIO MIU MKD MKM MKW MLD MLT MMK MMQ MMT MND MNJ MON MPA MQD MQH MQM MQS MQW MRD MRM MRW MSK MTK MTQ MTR MTS MTZ MVA MWH N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N20 N21 N22 N23 N24 N25 N26 N27 N28 N29 N3 N30 N31 N32 N33 N34 N35 N36 N37 N38 N39 N40 N41 N42 N43 N44 N45 N46 N47 N48 N49 N50 N51 N52 N53 N54 N55 N56 N57 N58 N59 N60 N61 N62 N63 N64 N65 N66 N67 N68 N69 N70 N71 N72 N73 N74 N75 N76 N77 N78 N79 N80 N81 N82 N83 N84 N85 N86 N87 N88 N89 N90 N91 N92 N93 N94 N95 N96 N97 N98 N99 NA NAR NCL NEW NF NIL NIU NL NM3 NMI NMP NPT NT NTU NU NX OA ODE ODG ODK ODM OHM ON ONZ OPM OT OZA OZI P1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P5 P50 P51 P52 P53 P54 P55 P56 P57 P58 P59 P60 P61 P62 P63 P64 P65 P66 P67 P68 P69 P70 P71 P72 P73 P74 P75 P76 P77 P78 P79 P80 P81 P82 P83 P84 P85 P86 P87 P88 P89 P90 P91 P92 P93 P94 P95 P96 P97 P98 P99 PAL PD PFL PGL PI PLA PO PQ PR PS PTD PTI PTL PTN Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q3 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 QA QAN QB QR QTD QTI QTL QTR R1 R9 RH RM ROM RP RPM RPS RT S3 S4 SAN SCO SCR SEC SET SG SIE SM3 SMI SQ SQR SR STC STI STK STL STN STW SW SX SYR T0 T3 TAH TAN TI TIC TIP TKM TMS TNE TP TPI TPR TQD TRL TST TTS U1 U2 UB UC VA VLT VP W2 WA WB WCD WE WEB WEE WG WHR WM WSD WTT X1 YDK YDQ YRD Z11 Z9 ZP ZZ X1A X1B X1D X1F X1G X1W X2C X3A X3H X43 X44 X4A X4B X4C X4D X4F X4G X4H X5H X5L X5M X6H X6P X7A X7B X8A X8B X8C XAA XAB XAC XAD XAE XAF XAG XAH XAI XAJ XAL XAM XAP XAT XAV XB4 XBA XBB XBC XBD XBE XBF XBG XBH XBI XBJ XBK XBL XBM XBN XBO XBP XBQ XBR XBS XBT XBU XBV XBW XBX XBY XBZ XCA XCB XCC XCD XCE XCF XCG XCH XCI XCJ XCK XCL XCM XCN XCO XCP XCQ XCR XCS XCT XCU XCV XCW XCX XCY XCZ XDA XDB XDC XDG XDH XDI XDJ XDK XDL XDM XDN XDP XDR XDS XDT XDU XDV XDW XDX XDY XEC XED XEE XEF XEG XEH XEI XEN XFB XFC XFD XFE XFI XFL XFO XFP XFR XFT XFW XFX XGB XGI XGL XGR XGU XGY XGZ XHA XHB XHC XHG XHN XHR XIA XIB XIC XID XIE XIF XIG XIH XIK XIL XIN XIZ XJB XJC XJG XJR XJT XJY XKG XKI XLE XLG XLT XLU XLV XLZ XMA XMB XMC XME XMR XMS XMT XMW XMX XNA XNE XNF XNG XNS XNT XNU XNV XO1 XO2 XO3 XO4 XO5 XO6 XO7 XO8 XO9 XOA XOB XOC XOD XOE XOF XOG XOH XOI XOJ XOK XOL XOM XON XOP XOQ XOR XOS XOT XOU XOV XOW XOX XOY XOZ XP1 XP2 XP3 XP4 XPA XPB XPC XPD XPE XPF XPG XPH XPI XPJ XPK XPL XPN XPO XPP XPR XPT XPU XPV XPX XPY XPZ XQA XQB XQC XQD XQF XQG XQH XQJ XQK XQL XQM XQN XQP XQQ XQR XQS XRD XRG XRJ XRK XRL XRO XRT XRZ XSA XSB XSC XSD XSE XSH XSI XSK XSL XSM XSO XSP XSS XST XSU XSV XSW XSX XSY XSZ XT1 XTB XTC XTD XTE XTG XTI XTK XTL XTN XTO XTR XTS XTT XTU XTV XTW XTY XTZ XUC XUN XVA XVG XVI XVK XVL XVN XVO XVP XVQ XVR XVS XVY XWA XWB XWC XWD XWF XWG XWH XWJ XWK XWL XWM XWN XWP XWQ XWR XWS XWT XWU XWV XWW XWX XWY XWZ XXA XXB XXC XXD XXF XXG XXH XXJ XXK XYA XYB XYC XYD XYF XYG XYH XYJ XYK XYL XYM XYN XYP XYQ XYR XYS XYT XYV XYW XYX XYY XYZ XZA XZB XZC XZD XZF XZG XZH XZJ XZK XZL XZM XZN XZP XZQ XZR XZS XZT XZU XZV XZW XZX XZY XZZ ', concat(' ', normalize-space(@unitCode), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-23]-Unit code MUST be coded according to the UN/ECE Recommendation 20 with
      Rec 21 extension</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:EmbeddedDocumentBinaryObject[@mimeCode]"
                 priority="2"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:EmbeddedDocumentBinaryObject[@mimeCode]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:EmbeddedDocumentBinaryObject[@mimeCode]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:EmbeddedDocumentBinaryObject[@mimeCode]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((@mimeCode = 'application/pdf' or @mimeCode = 'image/png' or @mimeCode = 'image/jpeg' or @mimeCode = 'text/csv' or @mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or @mimeCode = 'application/vnd.oasis.opendocument.spreadsheet')))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-24">
                     <xsl:attribute name="test">((@mimeCode = 'application/pdf' or @mimeCode = 'image/png' or @mimeCode = 'image/jpeg' or @mimeCode = 'text/csv' or @mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or @mimeCode = 'application/vnd.oasis.opendocument.spreadsheet'))</xsl:attribute>
                     <svrl:text>[BR-CL-24]-For Mime code in attribute use MIMEMediaType.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:EndpointID[@schemeID]" priority="1" mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:EndpointID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:EndpointID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cbc:EndpointID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0007 0009 0037 0060 0088 0096 0097 0106 0130 0135 0142 0151 0183 0184 0190 0191 0192 0193 0194 0195 0196 0198 0199 0200 0201 0202 0203 0204 0208 0209 0210 0211 0212 0213 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9918 9919 9920 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9957 AN AQ AS AU EM ', concat(' ', normalize-space(@schemeID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-25">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0007 0009 0037 0060 0088 0096 0097 0106 0130 0135 0142 0151 0183 0184 0190 0191 0192 0193 0194 0195 0196 0198 0199 0200 0201 0202 0203 0204 0208 0209 0210 0211 0212 0213 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9918 9919 9920 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9957 AN AQ AS AU EM ', concat(' ', normalize-space(@schemeID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-25]-Endpoint identifier scheme identifier MUST belong to the CEF EAS code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:DeliveryLocation/cbc:ID[@schemeID]"
                 priority="0"
                 mode="d12e29">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd12e3009']">
            <schxslt:rule pattern="d12e3009">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:DeliveryLocation/cbc:ID[@schemeID]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:DeliveryLocation/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d12e3009">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" flag="fatal">
                  <xsl:attribute name="context">cac:DeliveryLocation/cbc:ID[@schemeID]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' ')))))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}"
                                      flag="fatal"
                                      id="BR-CL-26">
                     <xsl:attribute name="test">((not(contains(normalize-space(@schemeID), ' ')) and contains(' 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0194 0195 0196 0197 0198 0199 0200 0201 0202 0203 0204 0205 0206 0207 0208 0209 0210 0211 0212 0213 ', concat(' ', normalize-space(@schemeID), ' '))))</xsl:attribute>
                     <svrl:text>[BR-CL-26]-Delivery location identifier scheme identifier MUST belong to the ISO 6523 ICD code list</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd12e3009')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:function name="schxslt:location" as="xs:string">
      <xsl:param name="node" as="node()"/>
      <xsl:variable name="segments" as="xs:string*">
         <xsl:for-each select="($node/ancestor-or-self::node())">
            <xsl:variable name="position">
               <xsl:number level="single"/>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test=". instance of element()">
                  <xsl:value-of select="concat('Q{', namespace-uri(.), '}', local-name(.), '[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of attribute()">
                  <xsl:value-of select="concat('@Q{', namespace-uri(.), '}', local-name(.))"/>
               </xsl:when>
               <xsl:when test=". instance of processing-instruction()">
                  <xsl:value-of select="concat('processing-instruction(&#34;', name(.), '&#34;)[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of comment()">
                  <xsl:value-of select="concat('comment()[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of text()">
                  <xsl:value-of select="concat('text()[', $position, ']')"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:for-each>
      </xsl:variable>
      <xsl:value-of select="concat('/', string-join($segments, '/'))"/>
   </xsl:function>
</xsl:transform>

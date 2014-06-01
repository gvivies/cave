        <div id="drink-div" style="display:none;">
            <g:form id="drinkForm" name="drinkForm" method="post" action="drink">
                <g:hiddenField id="hiddenId" name="hiddenId" value="" />
                <g:hiddenField name="hiddenMax" value="" />
                <g:hiddenField name="quantity" value="0" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
								<td valign="top" class="name" colspan="2"><div id="titleWine">Vin</div></td>
							</tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <div id="drinkTitle">J'en bois</div>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField id="drunkQuantity" name="drunkQuantity" value="1" />
                                </td>
                            </tr>
                            <tr>
								<td width="50%" align="center">
									<span class="arrayButton" id="drink-yes">Ok</span>
								</td>
								<td width="50%" align="center">
									<span class="arrayButton" id="drink-no">Annuler</span>
								</td>
							</tr>
                        </tbody>
                   </table>          
				</div>
			</g:form>	
        </div>
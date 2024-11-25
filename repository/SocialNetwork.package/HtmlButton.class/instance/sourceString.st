as yet unclassified
sourceString

	| template |
	template := '<table style="background-color: #{color}; border: 1px solid #{color}; border-radius: 5px;" border="0" width="100%" cellspacing="0" cellpadding="0">	 	 
<tbody>	 	 
<tr>	 	 
<td style="color: #ffffff; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: bold; letter-spacing: -.5px; line-height: 150%; padding: 15px 30px 15px 30px; text-align: center;" align="center" valign="middle"><a style="color: #ffffff; text-decoration: none;" href="{target}" target="_blank">{label}</a></td>	 	 
</tr>	 	 
</tbody>	 	 
</table>'.
	^ template format: { 
			#color -> self color asHexString.
			#target -> self target asString.
			#label -> self label } asDictionary
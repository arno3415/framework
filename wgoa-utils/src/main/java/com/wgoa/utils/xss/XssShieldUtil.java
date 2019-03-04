package com.wgoa.utils.xss;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author Arno
 * @Date 2019/1/20 13:31
 * @Version 1.0
 **/
public class XssShieldUtil {
    private static List<Pattern> patterns = null;

    private static List<Object[]> getXssPatternList() {
        List<Object[]> ret = new ArrayList<>();

        ret.add(new Object[]{"<(no)?script[^>]*>.*?</(no)?script>", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"\\\\u([0-9a-zA-Z]{4})(no)?script[^>]*\\\\u([0-9a-zA-Z]{4}).*?\\\\u([0-9a-zA-Z]{4})/(no)?script\\\\u([0-9a-zA-Z]{4})", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"<(no)?style[^>]*>.*?</(no)?style>", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"</(no)?script>", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"<(no)?script[^>]*>", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"\\\\u([0-9a-zA-Z]{4})", Pattern.CASE_INSENSITIVE});
        ret.add(new Object[]{"eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL});
        ret.add(new Object[]{"expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL});
        ret.add(new Object[]{"(javascript:|vbscript:|view-source:)*", Pattern.CASE_INSENSITIVE});
//        ret.add(new Object[]{"<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL});
        ret.add(new Object[]{"(window\\.location|window\\.|\\.location|document\\.cookie|document\\.|alert\\(.*?\\)|window\\.open\\()*", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL});
        ret.add(new Object[]{"<+\\s*\\w*\\s*(oncontrolselect|oncopy|oncut|ondataavailable|ondatasetchanged|ondatasetcomplete|ondblclick|ondeactivate|ondrag|ondragend|ondragenter|ondragleave|ondragover|ondragstart|ondrop|onerror=|onerroupdate|onfilterchange|onfinish|onfocus|onfocusin|onfocusout|onhelp|onkeydown|onkeypress|onkeyup|onlayoutcomplete|onload|onlosecapture|onmousedown|onmouseenter|onmouseleave|onmousemove|onmousout|onmouseover|onmouseup|onmousewheel|onmove|onmoveend|onmovestart|onabort|onactivate|onafterprint|onafterupdate|onbefore|onbeforeactivate|onbeforecopy|onbeforecut|onbeforedeactivate|onbeforeeditocus|onbeforepaste|onbeforeprint|onbeforeunload|onbeforeupdate|onblur|onbounce|oncellchange|onchange|onclick|oncontextmenu|onpaste|onpropertychange|onreadystatechange|onreset|onresize|onresizend|onresizestart|onrowenter|onrowexit|onrowsdelete|onrowsinserted|onscroll|onselect|onselectionchange|onselectstart|onstart|onstop|onsubmit|onunload)+\\s*=+", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL});
        return ret;
    }

    private static List<Pattern> getPatterns() {

        if (patterns == null) {

            List<Pattern> list = new ArrayList<Pattern>();

            String regex;
            Integer flag;
            int arrLength;

            for(Object[] arr : getXssPatternList()) {
                arrLength = arr.length;
                for(int i = 0; i < arrLength; i++) {
                    regex = (String)arr[0];
                    flag = (Integer)arr[1];
                    list.add(Pattern.compile(regex, flag));
                }
            }

            patterns = list;
        }

        return patterns;
    }

    public static String stripXss(String value) {
        if(StringUtils.isNotBlank(value)) {

            Matcher matcher;
            boolean falg = true;
            for(Pattern pattern : getPatterns()) {
//                System.out.println(value);
                matcher = pattern.matcher(value.trim());
//                System.out.println(value);
                // 匹配
                if(matcher.find()) {
                    // 删除相关字符串
                    if(falg && matcher.end() > 0){
                        value = matcher.replaceFirst("还玩?该换个花样了，兄dei!!!!");
                        falg = false;
                    }else{
                        value = matcher.replaceAll("");
                    }
                }
            }
        }

//      if (LOG.isDebugEnabled())
//          LOG.debug("strip value: " + value);

        return value;
    }


    public static void main(String[] args) {

        String value = "{\"pcLongitude\":16.826011599999998, \"pcLatitude\":98.5374612}";
        value = XssShieldUtil.stripXss(value);
        System.out.println("type-1: '" + value + "'");

        value = XssShieldUtil.stripXss("<script src='' onerror='alert(document.cookie)'></script>");
        System.out.println("type-2: '" + value + "'");

        value = XssShieldUtil.stripXss("\\u003Cscript\\u003E$\\u0028'#m111ainMenuId .hideM1enu a'\\u0029.text\\u0028'人生短短几游'\\u0029\\u003C/script\\u003E");
        System.out.println("type-3: '" + value + "'");

        value = XssShieldUtil.stripXss(" eval(abc);");
        System.out.println("type-4: '" + value + "'");

        value = XssShieldUtil.stripXss(" expression(abc);");
        System.out.println("type-5: '" + value + "'");

        value = XssShieldUtil.stripXss("<img src='' onerror='alert(document.cookie);'></img>");
        System.out.println("type-6: '" + value + "'");

        value = XssShieldUtil.stripXss("<img src='' onerror='alert(document.cookie);'/>");
        System.out.println("type-7: '" + value + "'");

        value = XssShieldUtil.stripXss("<img src='' onerror='alert(document.cookie);'>");
        System.out.println("type-8: '" + value + "'");

        value = XssShieldUtil.stripXss("<script language=text/javascript>alert(document.cookie);");
        System.out.println("type-9: '" + value + "'");

        value = XssShieldUtil.stripXss("<script>window.location='url'");
        System.out.println("type-10: '" + value + "'");

        value = XssShieldUtil.stripXss(" onload='alert(\"abc\");");
        System.out.println("type-11: '" + value + "'");

        value = XssShieldUtil.stripXss("<img src=x<!--'<\"-->>");
        System.out.println("type-12: '" + value + "'");

        value = XssShieldUtil.stripXss("<=img onstop=");
        System.out.println("type-13: '" + value + "'");


    }
}

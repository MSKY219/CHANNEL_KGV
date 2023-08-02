package com.kh.kgv.helpDesk.controller;

import org.owasp.html.HtmlPolicyBuilder;
import org.owasp.html.PolicyFactory;

public class SanitizeService {

    public String sanitize(String unsafeHTML) {
        PolicyFactory policy = new HtmlPolicyBuilder()
            .allowElements("a", "b", "i", "p", "br")
            .allowUrlProtocols("http", "https")
            .allowAttributes("href").onElements("a")
            .requireRelNofollowOnLinks()
            .toFactory();

        String safeHTML = policy.sanitize(unsafeHTML);
        safeHTML = safeHTML.replace("<br>", "<br/>");  // add this line

        return safeHTML;
    }
}
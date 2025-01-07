const personalChrome = {
    name: "Google Chrome",
    profile: "Default",
};

const workChrome = {
    name: "Google Chrome",
    profile: "Profile 2",
};

const vanillaChrome = {
    name: "Google Chrome",
};

const slackBundleId = "com.tinyspeck.slackmacgap";
const globalProtectBundleId = "com.paloaltonetworks.GlobalProtect.client";

const matchDomains = (domains) => {
    return finicky.matchDomains(
        domains.map((domain) => {
            const escapedDomain = domain.replace(/\./g, "\\.");
            return new RegExp(`(.+\\.)?${escapedDomain}`);
        })
    );
};

module.exports = {
    defaultBrowser: personalChrome,
    handlers: [
        {
            match: "slovnik.seznam.cz/*",
            browser: vanillaChrome,
        },
        {
            match: ({ url }) => url.pathname.includes("GlobalProtect"),
            browser: workChrome,
        },
        {
            // family planning board
            match: "https://miro.com/app/board/uXjVOXSuQCE=/",
            browser: personalChrome,
        },
        {
            match: matchDomains([
                "youtube.com",
                "reddit.com",
                "linkedin.com",
            ]),
            browser: personalChrome,
        },
        {
            match: ({ opener }) =>
                [slackBundleId, globalProtectBundleId].includes(
                    opener.bundleId
                ),
            browser: workChrome,
        },
        {
            match: matchDomains([
                "devrtb.com",
                "github.com",
                "miro.atlassian.net",
                "miro.com",
                "miro.glean.com",
                "okta.com",
                "testmiro.com",
                "login.docker.com",
                "miro.design",
                "app.lokalise.com",
                "cloud.memsource.com",
                "realtimeboard.app.opsgenie.com",
                "coda.io",
                "meet.google.com",
                "miro.tools",
            ]),
            browser: workChrome,
        },
    ],
};

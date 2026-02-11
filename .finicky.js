// use chrome://version to identify the profile name

const personalChrome = {
    name: "Google Chrome",
    profile: "Private",
};

const workChrome = {
    name: "Google Chrome",
    profile: "Work",
};

const vanillaChrome = {
    name: "Google Chrome",
};

const slackBundleId = "com.tinyspeck.slackmacgap";

const matchDomains = (domains) => {
    return finicky.matchHostnames(
        domains.map((domain) => {
            if (domain instanceof RegExp) {
                return domain
            }

            const escapedDomain = domain.replace(/\./g, "\\.");
            return new RegExp(`(.+\\.)?${escapedDomain}`);
        })
    );
};

export default {
    defaultBrowser: personalChrome,
    handlers: [
        {
            match: "slovnik.seznam.cz/*",
            browser: vanillaChrome,
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
            match: (_url, { opener }) =>
                [slackBundleId].includes(
                    opener.bundleId
                ),
            browser: workChrome,
        },
        {
            match: matchDomains([
                "127.0.0.1",
                "localhost",
                "devrtb.com",
                "github.com",
                "atlassian.net",
                "okta.com",
                "testmiro.com",
                "login.docker.com",
                "app.lokalise.com",
                "cloud.memsource.com",
                "realtimeboard.app.opsgenie.com",
                "coda.io",
                "meet.google.com",
                /^miro\./,
                /\.miro\./,
                /miro.tools$/,
                "cursor.sh",
                "cursor.com",
                "app.signadot.com",
                "auth.signadot.com",
                "www.braintrust.dev",
                "app.incident.io",
                "miro-be.glean.com"
            ]),
            browser: workChrome,
        },
    ],
};

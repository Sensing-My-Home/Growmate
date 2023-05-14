import { Cache } from "react-native-cache";

const userCache = new Cache({
    namespace: "myapp",
    policy: {
        maxEntries: 100,
        stdTTL: 0
    },
    backend: AsyncStrorage
})
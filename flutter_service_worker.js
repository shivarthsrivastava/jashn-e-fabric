'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0391cd97a64c2fc58bc26c077909ead4",
"version.json": "167a4184b50462e02b59f0327a33982c",
"index.html": "8ce7e8cff4ff0335107e82fd87b8142a",
"/": "8ce7e8cff4ff0335107e82fd87b8142a",
"main.dart.js": "fdf2402d739f83780b08809236a30fcb",
"START_HERE.md": "ae64bc8f7fcaa66b7da8b576f408ae06",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"README.md": "4c63a157249f8b68e44d7b4c75a8b9db",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "de8a16bccbd1896977dd210eef0735d6",
".git/config": "38881ccff4dc4e249623736f3cd97a15",
".git/objects/0d/34da910eb6579d42a3ed1074f46a9dc08797fb": "3dfc80e1523f96a8d619c3b5fcfac04c",
".git/objects/6f/8c4695a47776df7a3823f9d438e79395feb820": "32b4f60295a352aeece24be860e09a6a",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/35/f077a9361393fce1919394db814227a5c39ba4": "773278fdb4fccdafd21addd369dd69a3",
".git/objects/5f/474ab275feb42d8328c9e640b33c0e2dc1fd1e": "c76d460005669ed1707d52bb8f2da7fd",
".git/objects/02/3db1db699c218889de9cb454bb7ddfa5d7d61b": "878b41a74a94b8250457b2e26fec3d0e",
".git/objects/b5/6787e4f0eb3ba358466f53598aa8f8658abeeb": "aca4abded3bf45d1131aed66fa6c2047",
".git/objects/b2/8e915a042e63ccd6f4a0abb6e1b8b59c5432df": "19525721bd338d00e3816e15841fd5df",
".git/objects/d7/f590eb52d32436ab237627b1a64df3c7eec42b": "51db334ac03ea1cb12e7cd2a10fccd39",
".git/objects/da/77dc1b8817ee1b12870eacfb3d1a226ea69b62": "73d18025b4777a66da08e13820f88fc7",
".git/objects/da/0d5aa44a8c93eda469f7a99ed8feac32d5b19d": "25d25e93b491abda0b2b909e7485f4d1",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/780f4eff4bcfacc0dd54fd0eeb85b60e994dcd": "971331984124347bba1b29491c22fea5",
".git/objects/d8/8128adaad90d2fd7cdabe7b36eaaaed0d3a25b": "3d15963af0d77c1cd40702fb7c18fa93",
".git/objects/e5/23bcd5b37f0e0fd699aeae7646d41532941908": "b236c14861f8958b59e5f88d75f0387b",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/6c2cdc90f7c66e997e9bc21fc9ae5d3cc6f7bc": "d5ead3eb28701108f1b8903e0199b3f8",
".git/objects/ee/dc83ee386e840019cf4ae293c87dc7439c59d1": "b687ec433e1bbea815c2d106c8389eb4",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/20/00a85bd4cbc6008d5b945854bd670a59e344a6": "62c9eda4e8d8a636a04c6346aff77ca4",
".git/objects/7d/874c9db6aa8df16234d49a0a104f4384e5599b": "ad72634f7af3be4a268dd02139632692",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/1f/4f8a96457f846d19180d741005f728fece55a4": "d56fc41f9244691e1acb976015fae87e",
".git/objects/73/10c4c8c40a94663fdf8b9ab72a0e250a268681": "cc0a6a6ea857dd76b086837e997d1c73",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4d/8ae07642e7a34ec45e4d971a49e1155600b8f7": "1d43338fc723ecf73d02614c70e0181b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/00/ccbbd4291d9be46bafff389056e7ba51cc20a8": "f537afd72ce7ed1db1e02399102ba19f",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/6d/e610b86edb98b2454c44d70836ff39d23be9cb": "738bbe79b3439e3924ecae03f65da43f",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/2ea23b42a47d9fefe7e55455abd371191144e3": "74ac5571a854a05806cd2d9b88950bb1",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/f1/3f80b558250730737768f8f424fa2cdd292d63": "73b6dc1d34c74b84da4a413f3d02b0c1",
".git/objects/f8/ff20bf94533e1d63efa0a6091b4d9bd3a03c92": "ae5e29838895d50d6a8f4d15373c75fc",
".git/objects/2c/21074247b37b2e8bc435a32d59f6083599a5f2": "22227b56be0d9d566e2d8c6474185d99",
".git/objects/2d/a58154e8ad4f108df111e7ea5b51d5250aae19": "44fa65a39879994c07610544bde3d9ee",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/4f/cf3cfa4560e86bb477982487fcbef28f4464b7": "fc1c96c6be91fed5a0312fe6449c8943",
".git/objects/1d/aed88844e42eed00ccde7494e462c640a64125": "1db572bc7f556d9a3c36aff1697bd649",
".git/objects/1d/d82f33df88bb7f3c59573213250d45dc6f4e00": "09930623803d1bdd66bc3950ab08613a",
".git/objects/1c/d0b3410c13175b70d6cc9170ac9ee9f18b7d9c": "ce08a5cbebbe9b5bd5c8de109a58cddb",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "81ff0c14e42331a0e2e0c7967294770e",
".git/logs/refs/heads/main": "81ff0c14e42331a0e2e0c7967294770e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "4d75a3cfcec915e2c3b72d7f869f2cb9",
".git/index": "24183742bd67a8aaa2b8cacd444c6691",
".git/COMMIT_EDITMSG": "f6385e68830d42fd149c7473c006581a",
"assets/AssetManifest.json": "f91ccd0a2dd8f3b50ca31363de258114",
"assets/NOTICES": "12f02037c44f039ccf8f482f6b1cd75e",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "59c8fbbabb088e00d808c383f7f26d6f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a969b46c76a398d9e67796dc2f62d108",
"assets/fonts/MaterialIcons-Regular.otf": "d16b527f8b2318b54ae49194467fa0a5",
"assets/assets/images/Gemini_Generated_Image_q8e264q8e264q8e2.png": "2ee68473dc0df704def15b1e49859b23",
"assets/assets/images/Gemini_Generated_Image_vm4m7lvm4m7lvm4m.png": "68eab845e38197adad25eab714b5033b",
"assets/assets/images/ChatGPT%2520Image%2520Aug%252030,%25202025%2520at%252001_35_21%2520PM.png": "5d06439dab1e46ebcc489b5498a5b806",
"assets/assets/images/Gemini_Generated_Image_mczlkfmczlkfmczl.png": "e49133ea87ac19e7ff499fba04a0292a",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"serve.sh": "0fb5c37a03ec966088682b4ba08b8d98"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

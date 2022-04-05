'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b0cb9a2706b39eb0ff276ae9a39c2d9f",
"assets/assets/fonts/Janna.ttf": "378ee291669883b443cc8036d148b4fe",
"assets/assets/images/activityicon.png": "dc2d6e6d524145a972949a89a6fdf8c0",
"assets/assets/images/button.png": "ae1954de72b4c61cbd50c88d5518b866",
"assets/assets/images/hera.png": "2c7a38a73fd5197c58385f7a941287bf",
"assets/assets/images/hera1-min.png": "11e8e9e827c196b5b05a448f8ac0d6b6",
"assets/assets/images/icon.png": "43e983ebb2bd47b63738d5d1204f3007",
"assets/assets/images/jouf.png": "31274659a32f888ca2debe16dc3a0632",
"assets/assets/images/madinahicon.png": "5e064fc2c4f1ae3cab2b70c07457a783",
"assets/assets/images/makkahicon.png": "cfd4f7695ded87e26a339416441b3c09",
"assets/assets/images/person.png": "8616ecef4c6b28aff41ef75c00a820ba",
"assets/assets/images/safiya.png": "1932e882491986788d76cf821480fd02",
"assets/assets/images/salam.png": "c34323582add1d6158ee6f99e24466ef",
"assets/assets/images/showroomicon.png": "bbe7b5f1a1d769ec98a78b45655073da",
"assets/assets/images/tabuk.png": "45f26cb0ae321a01274d21a9b0f5acf7",
"assets/assets/images/thor.png": "5f4e16b3104ee6b4716657f689a97c6f",
"assets/assets/images/thor1-min.png": "54d771259440066cf4124d04a3bd9d15",
"assets/assets/images/wahi.png": "0b88a5cc61396ff3bd4e9e0c44944c9d",
"assets/assets/svg/activity.svg": "9d650c05f3a21ed1189bd7560758e32a",
"assets/assets/svg/madinah.svg": "9ef8b9e2d300100adaab579fc7e8fda2",
"assets/assets/svg/main.svg": "c1d954fd7678c35af8e834fbd2fbfbf7",
"assets/assets/svg/makkah.svg": "f5d3be179af198ddd385fcfc83da7d5a",
"assets/assets/svg/menu.svg": "1576dff3d239101aad23c5f2b6b8bd23",
"assets/assets/svg/museum.svg": "e409fc36a407f0df0c033b665157d7dc",
"assets/assets/svg/profile.svg": "0fdbb8e3640297f1fddac2e158c69949",
"assets/assets/svg/search.svg": "dbe233df0b299e7716a35722f02a0d97",
"assets/assets/svg/stats.svg": "a95aa9471676f7cff76f5fff79d36974",
"assets/FontManifest.json": "129eed99cac3060d36a964c085c8b96f",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "e1ce455344617c9971ed5881a223edfd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "81c141fea5d60e685793844214ad4f84",
"/": "81c141fea5d60e685793844214ad4f84",
"main.dart.js": "a9599e0142964a6d1f346d544225a66a",
"manifest.json": "72a79ceb2ed44b667a2229e31329144e",
"version.json": "a7cfaefe8d6374a30d4aaff1d668f694"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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

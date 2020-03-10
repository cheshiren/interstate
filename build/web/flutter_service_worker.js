'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "747a70f2e3db43904530acf0e57bbacb",
"/assets\assets\fonts\FiraSans-Bold.ttf": "a1acb00f5bffd4e7b86f0cfb89fa184a",
"/assets\assets\fonts\FiraSans-Italic.ttf": "a64f4d7e638fd4a29cf8db587c6cf256",
"/assets\assets\fonts\FiraSans-Regular.ttf": "895f5b025a6cc4924b263f6beb06c777",
"/assets\FontManifest.json": "4b26adbcaac18018c0fd6d6aedad963e",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\LICENSE": "4fec760759443712c5cebba8da777987",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/index.html": "cd2081d6be662329ae9ec4f27f6db2c0",
"/main.dart.js": "017caf2d1af6db2ad77be6289d011b58"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});

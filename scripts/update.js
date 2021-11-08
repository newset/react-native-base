const path = require('path');
const root = process.cwd();
const cp = require("child_process");
const { LockfileParser } = require('@snyk/cocoapods-lockfile-parser');

function parse() {
  // lock file
  const file = path.join(root, 'Podfile.lock')
  const lock = LockfileParser.readFileSync(file).toDepGraph();
  // 根目录执行依赖查询
  const command = `pod ipc podfile-json Podfile`;
  const pods = cp.execSync(command, { encoding: 'utf8' });
  return { lock, pods: JSON.parse(pods) }
}


/**
 * 查询Spec from soures
 * POST https://wbhhamhynm-2.algolianet.com/1/indexes/cocoapods/query?x-algolia-agent=Algolia%20for%20JavaScript%20(3.33.0)%3B%20Browser&x-algolia-application-id=WBHHAMHYNM&x-algolia-api-key=4f7544ca8701f9bf2a4e55daff1b09e9
 * {"params":"query: Afnetworking"}
 * 
 */
async function query(name) {
  const url = 'https://wbhhamhynm-2.algolianet.com/1/indexes/cocoapods/query?x-algolia-agent=Algolia%20for%20JavaScript%20(3.33.0)%3B%20Browser&x-algolia-application-id=WBHHAMHYNM&x-algolia-api-key=4f7544ca8701f9bf2a4e55daff1b09e9'
  const data = { "params": `query: ${name}` }
  return {}
}

/**
 * 下载
 */
function clone(repo) {
  const { homepage, version, source } = repo;
  // 直接 import 覆盖

}

/**
 * 上传到私有源
 * 创建repo -> 上传
 */
function sync(repo, tag) {

}

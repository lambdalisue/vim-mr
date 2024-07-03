import type {
  Denops,
  Entrypoint,
} from "https://deno.land/x/denops_std@v6.5.0/mod.ts";
import { ensure, is } from "jsr:@core/unknownutil@3.18.1";

export const main: Entrypoint = (denops) => {
  denops.dispatcher = {
    "mrr:list": () => list(denops, "mr#mrr#filename"),
    "mru:list": () => list(denops, "mr#mru#filename"),
    "mrw:list": () => list(denops, "mr#mrw#filename"),
  };
};

async function list(denops: Denops, varname: string): Promise<string[]> {
  const filename = ensure(
    await denops.eval(`expand(g:${varname})`),
    is.String,
  );
  const text = await Deno.readTextFile(filename);
  return text.split("\n")
    .map((v) => v.trim())
    .filter((v) => v !== "");
}

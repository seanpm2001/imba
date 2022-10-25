import { createCompileImba } from './utils/compile.ts'
import {parseAsset} from 'imba/compiler'

def compile-svg(body\string, url\string)
	let parsed = parseAsset({body})
	# special serializer
	let js = """
	export default /* @__PURE__ */ Object.assign(\{
		type: 'svg'
	\},{JSON.stringify(parsed)})
	"""

export default def svgPlugin(options = {})
	const cache = new Map
	return
		name: "vite-plugin-imba-svg"
		transform: do(source, id, opts)
			if id.endsWith('.svg')
				let result2 = cache.get(id)
				if !result2
					result2 = await compile-svg source, id
					cache.set id, result2
				return result2

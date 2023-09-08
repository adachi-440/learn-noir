use dep::noir_trie_proofs;
global DEPTH8_MAX: Field = 4256;

fn main(storage_root: pub [u8; 32], trie_proof: noir_trie_proofs::TrieProof<32, DEPTH8_MAX, 32>) {
    assert(trie_proof.verify_storage_root(storage_root));
}
